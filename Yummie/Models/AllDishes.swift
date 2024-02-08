//
//  AllDishes.swift
//  Yummie
//
//  Created by Maryna Bolotska on 07/02/24.
//

import Foundation
struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
