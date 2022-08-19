//
//  PostModel.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 17/08/22.
//

import Foundation

struct Post: Decodable {
    var id: String
    var content: String
    var media: String?
    var likeCount: Int?
    var userID: String
    var createdAt: String
    var updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case likeCount = "like_count"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case content
        case userID = "user_id"
        case media
    }
}
