//
//  TestDataSchema.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.21.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

struct Rate: Decodable {
    //{
    //    "r030":36,"txt":"Австралійський долар","rate":19.801425,"cc":"AUD","exchangedate":"28.01.2019"
    //    "r030":36,"txt":"Австралійський долар","rate":19.170981,"cc":"AUD","exchangedate":"08.02.2019"
    //    }
    let r030: Int
    let txt: String
    let rate: Double
    let cc: String
    let exchangedate: String
}
