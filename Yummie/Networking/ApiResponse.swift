//
//  ApiResponse.swift
//  Yummie
//
//  Created by Maryna Bolotska on 07/02/24.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
