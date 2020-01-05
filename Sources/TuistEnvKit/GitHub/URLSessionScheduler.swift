import Foundation
import RxSwift

protocol URLSessionScheduling: AnyObject {
    /// Schedules an URLSession request and returns the result synchronously.
    ///
    /// - Parameter request: request to be executed.
    /// - Returns: request's response.
    func schedule(request: URLRequest) -> (error: Error?, data: Data?)

    /// Returns an observable that schedules a URLSession request.
    /// The data or error returned by the session are forwarded to the observers.
    /// - Parameter request: Request to be scheduled.
    func observable(request: URLRequest) -> Observable<Data>
}

final class URLSessionScheduler: URLSessionScheduling {
    // MARK: - Constants

    /// The default request timeout.
    static let defaultRequestTimeout: Double = 3

    // MARK: - Attributes

    /// Session.
    private let session: URLSession

    /// Request timeout.
    private let requestTimeout: Double

    /// Initializes the client with the session.
    ///
    /// - Parameter session: url session.
    /// - Parameter requestTimeout: request timeout.
    init(session: URLSession = URLSession.shared,
         requestTimeout: Double = URLSessionScheduler.defaultRequestTimeout) {
        self.session = session
        self.requestTimeout = requestTimeout
    }

    func schedule(request: URLRequest) -> (error: Error?, data: Data?) {
        var data: Data?
        var error: Error?
        let semaphore = DispatchSemaphore(value: 0)
        session.dataTask(with: request) { sessionData, _, sessionError in
            data = sessionData
            error = sessionError
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(timeout: .now() + 3)
        return (error: error, data: data)
    }

    func observable(request: URLRequest) -> Observable<Data> {
        return Observable.create { (observer) -> Disposable in
            let task = self.session.dataTask(with: request) { sessionData, _, sessionError in
                if let sessionError = sessionError {
                    observer.onError(sessionError)
                } else if let sessionData = sessionData {
                    observer.onNext(sessionData)
                    observer.onCompleted()
                } else {
                    observer.onCompleted()
                }
            }
            let disposable = Disposables.create {
                task.cancel()
            }
            task.resume()
            return disposable
        }
    }
}
