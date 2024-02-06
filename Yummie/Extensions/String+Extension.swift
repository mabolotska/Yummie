//
//  String+Extension.swift
//  Yummie
//
//  Created by Maryna Bolotska on 04/02/24.
//

import Foundation


extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
