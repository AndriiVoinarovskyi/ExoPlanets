//
//  SourceDataService.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.19.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation



class SourceDataServiceNamesRespond {
    let baseLink = "https://api.arcsecond.io/exoplanets/?page=1&page_size=200"
    var namesArray : [String] = []
    func load(complition : @escaping ([String])->()) {
        guard let url = URL(string: baseLink) else {
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
                //                print("Data = \(data)")
                //                print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")
                let decoder = JSONDecoder()
                do {
                    let item = try decoder.decode(Exoplanets.self, from: data)
                    
                    for item in item.results ?? [] {
                        self.namesArray.append(item.name ?? "N/A")
                    }
                    
                    complition(self.namesArray)
                } catch { print(error)}
                
                //                print("Load Data: next = \(item?.next ?? "")")
            }
        }
        task.resume()
    }
}
