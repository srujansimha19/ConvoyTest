//
//  WebService.swift
//  ConvoyTest
//
//  Created by Srujan Simha Adicharla on 12/16/19.
//  Copyright © 2019 Srujan Simha Adicharla. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case domainError
    case decodeError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

final class Webservice {
    
    init() { }
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            if let result = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodeError))
            }
            }.resume()
    }
}
