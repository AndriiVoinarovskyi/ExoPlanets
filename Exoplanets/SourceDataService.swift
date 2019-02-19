//
//  SourceDataService.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.19.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation

let baseLink = "https://api.arcsecond.io/exoplanets/"

class SurceDataService {
    func load(complition : @escaping (Exoplanets)->()) {
        guard let url = URL(string: baseLink) else { print ("Wrong URL"); return }
        var request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { print("Wrong Data"); return }
            let decoder = JSONDecoder()
            let item = try? decoder.decode(Exoplanets.self, from: data)
            complition((item ?? nil)!)
        }
        task.resume()
    }
}
