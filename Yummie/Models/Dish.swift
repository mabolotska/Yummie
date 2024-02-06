//
//  Dish.swift
//  Yummie
//
//  Created by Maryna Bolotska on 05/02/24.
//

import Foundation

struct Dish: Decodable {
    
//    let name, formattedCalories, description, image: String?
    
    let name, description, image: String?
    let calories: Int?
    
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
