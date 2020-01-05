import Foundation
import RxSwift
import TuistSupport
import TuistSupportTesting
@testable import TuistEnvKit

final class MockURLSessionScheduler: URLSessionScheduling {
    var scheduleStub: ((URLRequest) -> (Error?, Data?))?
    var observableStub: Result<Data, Error>?

    func schedule(request: URLRequest) -> (error: Error?, data: Data?) {
        return scheduleStub?(request) ?? (error: nil, data: nil)
    }

    func observable(request: URLRequest) -> Observable<Data> {
        guard let observableStub = observableStub else {
            return Observable.error(TestError("MockURLSessionScheduler received a request \(request) that hasn't been stubbed"))
        }
        switch observableStub {
        case let .failure(error):
            return Observable.error(error)
        case let .success(data):
            return Observable.just(data)
        }
    }
}
