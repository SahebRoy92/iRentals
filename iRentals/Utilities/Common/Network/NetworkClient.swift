//
//  NetworkClient.swift
//  iRentals
//
//  Created by sahebroy on 23/06/22.
//

import Foundation

class NetworkClient<T: APIRequest> {
    let request: T
    let session: URLSession
    
    typealias NetworkCompletion = (NetworkResult) -> Void
    enum NetworkResult {
        case success(T.ResponseDataType)
        case failure(NetworkError)
    }
    
    init(request: T, session: URLSession = .shared) {
        self.request = request
        self.session = session
    }

    func fetch(_ data: T.RequestDataType, completion: @escaping NetworkCompletion) {
        guard let urlRequest = request.makeRequest(from: data) else {
            return completion(.failure(.wrongURL))
        }
        session.dataTask(with: urlRequest) { data, _, _ in
            guard let data = data else {
                return completion(.failure(.serverError))
            }
            if let parsed = self.request.parseResponse(data: data) {
                return completion(.success(parsed))
            } else {
                return completion(.failure(.parsingError))
            }
           
        }.resume()
    }
}
