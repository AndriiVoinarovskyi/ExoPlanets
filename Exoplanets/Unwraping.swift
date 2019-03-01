//
//  Unwraping.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.28.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

class Unwraping {
    
    func unwrapString (value: String?) -> String {
        if value != nil {
            return value!
        }
        return "\tN/A"
    }
    
    func unwrapDouble (value: Double?) -> String {
        if value != nil {
            return "\(value!)"
        }
        return "\tN/A"
    }
    
    func unwrapInt (value: Int?) -> String {
        if value != nil {
            return "\(value!)"
        }
        return "\tN/A"
    }
}
