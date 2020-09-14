//
//  URLDataRetriever.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 23/08/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import Foundation

struct URLDataRetriever {
    
    func retrieve<T>(url: String, method: String, resultBlock: @escaping (Result<T, Error>) -> Void) where T: Decodable, T: Encodable {
        
        guard let url = URL(string: url) else {
            assertionFailure("wrong url format")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let e = error {
                resultBlock(Result.failure(e))
            }
            if let r = response as? HTTPURLResponse {
                print(r.statusCode)
            }
            guard let d = data else { return }
            do {
                let json = try JSONDecoder().decode(T.self, from: d)
                resultBlock(Result.success(json))
            } catch let error {
                resultBlock(Result.failure(error))
            }
            
        }
        task.resume()
    }
}
