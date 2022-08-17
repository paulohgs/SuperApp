//
//  UserModel.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 11/08/22.
//

import Foundation

public struct User: Decodable {
    
    var id: String
    var name: String
    var email: String
    var password: String?
    var avatar: String?
    
}

public struct CreateUser: Codable {
    
    var name: String
    var email: String
    var password: String
    
}
