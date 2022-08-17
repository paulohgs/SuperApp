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
        urlRequest.allHTTPHeaderFields = [   //Consiguracao do Header e o tipo do conteudo
            "Content-Type" : "application/json"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data (for: urlRequest) // Cria a sessao e faz a requisicao
            let usuarios: [User] = try JSONDecoder().decode([User].self, from: data) // descodifica os dados da requisicao
            print(data)
            print(usuarios)
            print(response)
            
            
            for usuario in usuarios {
                print(usuario.name)
                print(usuario.id)
                print(usuario.email)
            }
            
            return usuarios
            
        } catch {
            print(error)
        }
        
        return []
    }
    
    public static func getUserByID(id: String) async -> User? {
        
        var componentURL = URLComponents()
        componentURL.scheme = "http"
        componentURL.host = "adaspace.local"
        //        componentURL.port = 8080
        componentURL.path = "/users/\(id)"
        let url: URL = componentURL.url!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Content-Type" : "application/json"]
        
        do {
            
            let(data, response) = try await URLSession.shared.data(for: urlRequest)
            if let httpRes = response as? HTTPURLResponse {
                switch httpRes.statusCode {
                case 200...300:
                    print("success")
                    let usuario: User = try JSONDecoder().decode(User.self, from: data)
                    print(usuario.id)
                    return usuario
                default:
                    print("error", httpRes.statusCode)
                    return nil
                }
            }
            
        } catch {
            print(error)
        }
        return nil
    }
    
    public static func createUser(name: String, email: String, password: String) async -> [String : User]? {
        
        let usuario: CreateUser = CreateUser(name: name, email: email, password: password)
        
        // Configuracao da URL
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        //        urlComponent.host = "adaspace.local"
        urlComponent.host = "localhost"
        urlComponent.port = 8080
        urlComponent.path = "/users"
        let url: URL = urlComponent.url!
        
        // Configuracao da URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [   //Consiguracao do Header e o tipo do conteudo
            "Content-Type" : "application/json"
        ]
        let data = try? JSONEncoder().encode(usuario)
        urlRequest.httpBody = data
        
        // fazendo requisicao
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print(data)
            print(response)
            
            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200...300:
                    print("success")
                    let dataDecoded: [String : String] = try JSONDecoder().decode([String : String].self, from: data) // duvida nessa operaçao
                    print(dataDecoded)
                default:
                    print("error")
                    return nil
                }
            }
            
        } catch {
            print(error)
            return nil
        }
        
        return nil
        
    }
    
    public static func getAllPosts() async -> [Post] {
        // configuracao de url
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "adaspace.local"
        urlComponent.path = "/posts"
        let url: URL = urlComponent.url!
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = [   //Consiguracao do Header e o tipo do conteudo
            "Content-Type" : "application/json"
        ]
        
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            if let httpRes = response as? HTTPURLResponse {
                switch httpRes.statusCode {
                case 200...300:
                    print("success")
                    print(data)
                    let posts: [Post] = try JSONDecoder().decode([Post].self, from: data)
                    print(posts)
                    
                default:
                    print("deu erro em bixao!")
                }
            }
        } catch {
            print(String(describing: error))
        }
        
//        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, response, error) in
//            if let httpRes = response as? HTTPURLResponse {
//                switch httpRes.statusCode {
//                case 200...300:
//                    print("success")
//                default:
//                    print("error")
//                }
//            }
//            guard let data = data else { return }
//            do {
//                let allPosts: [Post] = try JSONDecoder().decode([Post].self, from: data)
//                print(allPosts)
//            } catch {
//                print(error.localizedDescription)
//            }
//            //                print(allPosts)
//            //                return allPosts
//
//        })
        return []
    }
    
}

