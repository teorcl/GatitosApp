//
//  CatData.swift
//  GatitosApp
//
//  Created by TEO on 12/11/22.
//

import Foundation

// MARK: - Cat
struct Cat: Decodable {
    let name, origin: String
    let affectionLevel:Int
    let intelligence: Int
    let image: Image?

    enum CodingKeys: String, CodingKey {
        case name
        case origin
        case affectionLevel = "affection_level"
        case intelligence
        case image
    }
}

// MARK: - Image
struct Image: Decodable{
    let url: String
}
