//
//  Order.swift
//  Yummie
//
//  Created by Maryna Bolotska on 06/02/24.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
