//
//  SourceDataService.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.19.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation



class SourceDataServicePlanetRespond {
    let baseLink = "https://api.arcsecond.io/exoplanets/"
    var linkParameter = ""
    var planet : Planet = Planet()
    
    
    func load(linkParameter: String, complition : @escaping (Planet)->()) {
        var parameter = linkParameter.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        parameter = parameter.replacingOccurrences(of: "/", with: "%2F", options: .literal, range: nil)
        
        let link = baseLink + parameter + "/"
        print("Link = \(link)")
        guard let url = URL(string: link)
            else {
            print("Wrong URL")
            complition (Planet())
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { print("Wrong Data"); complition (Planet()); return }
                //                print("Data = \(data)")
                //                print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")
                let decoder = JSONDecoder()
                do {
                    let item = try decoder.decode(Planet.self, from: data)
                    
                    complition(item)
                } catch { print(error)}
                
                //                print("Load Data: next = \(item?.next ?? "")")
            }
        }
        task.resume()
    }
}

