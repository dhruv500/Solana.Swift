import Foundation

extension Solana {
    func getProgramAccounts<T: BufferLayout>(publicKey: String,
                                             configs: RequestConfiguration? = RequestConfiguration(encoding: "base64"),
                                             decodedTo: T.Type,
                                             onComplete: @escaping (Result<[ProgramAccount<T>], Error>) -> ()) {
        router.request(parameters: [publicKey, configs]){ (result: Result<[ProgramAccount<T>], Error>) in
            switch result {
            case .success(let programs):
                onComplete(.success(programs))
            case .failure(let error):
                onComplete(.failure(error))
            }
        }
    }
}
