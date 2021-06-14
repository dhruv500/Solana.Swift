import Foundation

extension Solana {
    func getLargestAccounts(onComplete: @escaping(Result<[LargestAccount], Error>)->()) {
        request() { (result:Result<Rpc<[LargestAccount]?>, Error>) in
            switch result {
            case .success(let rpc):
                guard let value = rpc.value else {
                    onComplete(.failure(SolanaError.nullValue))
                    return
                }
                onComplete(.success(value))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}