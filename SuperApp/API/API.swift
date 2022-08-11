//
//  API.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 11/08/22.
//

import Foundation

class API {
    
    public static func PegaTodosUsuarios() async -> [User] {
        
        
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "adaspace.local"
        urlComponent.path = "/users"
        let url: URL = urlComponent.url!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [
            "Content-Type" : "application/json"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data (for: urlRequest)
            print(data)
            print(response)
            
        } catch {
            print(error)
        }
        
        return []
    }
}

