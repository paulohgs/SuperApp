//
//  SessionModel.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 18/08/22.
//

import Foundation

struct Session: Decodable {
    var token: String
    var user: User
}
