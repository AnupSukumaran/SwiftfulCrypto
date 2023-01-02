//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by sukumar.sukumaran on 31/12/2022.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badResponseError(url: URL)
        case unknownError
        
        func errorDescription() -> String? {
            switch self {
            case .badResponseError(url: let url): return "[🔥] Bad URL Response - \(url)"
            case .unknownError: return "[⚠️] Unknown Error"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
        let urlSession = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
        return urlSession
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badResponseError(url: url)
        }
        
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("Error = \(error.localizedDescription)")
        }
    }
}
