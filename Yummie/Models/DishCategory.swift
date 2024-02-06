//
//  DishCategory.swift
//  Yummie
//
//  Created by Maryna Bolotska on 04/02/24.
//

import Foundation


struct DishCategory: Decodable {
    let id, name, image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
