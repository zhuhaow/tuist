import Basic
import Foundation
import RxSwift
import TuistCore
import TuistGalaxy

final class MockCacheStorage: CacheStoraging {
    var existsStub: ((String) -> Bool)?
    func exists(hash: String) -> Single<Bool> {
        if let existsStub = existsStub {
            return Single.just(existsStub(hash))
        } else {
            return Single.just(false)
        }
    }

    var fetchStub: ((String) -> AbsolutePath)?
    func fetch(hash: String) -> Single<AbsolutePath> {
        if let fetchStub = fetchStub {
            return Single.just(fetchStub(hash))
        } else {
            return Single.just(AbsolutePath.root)
        }
    }

    var storeStub: ((_ hash: String, _ xcframeworkPath: AbsolutePath) -> Void)?
    func store(hash: String, xcframeworkPath: AbsolutePath) -> Completable {
        if let storeStub = storeStub {
            storeStub(hash, xcframeworkPath)
        }
        return Completable.empty()
    }
}
