//
//  TestSourceDataService.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.21.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

let testbaseLink = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json="

class TestSourceDataService {
    func load(complition : @escaping ([Rate])->()) {
        guard let url = URL(string: testbaseLink) else {
            print("Wrong URL")
            complition ([])
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { print("Wrong Data"); complition ([]); return }
                print("Data = \(data)")
                let decoder = JSONDecoder()
                let item = try? decoder.decode([Rate].self, from: data)
                complition(item ?? [])
                print("Load Data: count = \(item?.count ?? -1)")
            }
        }
        task.resume()
    }
}
