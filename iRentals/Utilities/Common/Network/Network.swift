//
//  NetworkClient.swift
//  iRentals
//
//  Created by sahebroy on 23/06/22.
//

import Foundation

struct Network: APIRequest {
    
    func makeRequest(from data: Request) -> URLRequest? {
        guard let components = URLComponents(string: data.getFullURL()) else {
            return nil
        }
        return URLRequest(url: components.url!)
    }
    
    func parseResponse(data: Data) -> [Cars]? {
        do {
            let data = try JSONDecoder().decode([Cars].self, from: data)
            return data
        } catch {
            print(error)
            return nil
        }
    }
    
}
