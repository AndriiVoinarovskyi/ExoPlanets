//
//  SourceDataService.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.19.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import Foundation



class SourceDataServiceNamesRespond {
    let baseLink = "https://api.arcsecond.io/exoplanets/"
    var namesArray : [String] = []
    var nextLink : String? = ""
    let downloadGroup = DispatchGroup()
    var resultingNamesArray : [String] = []
    
    func loadPage(link: String?, complition : @escaping (([String], String?))->()) {
        print("Start page loading")
        guard let url = URL(string: link ?? "N/A") else {
            print("Wrong URL")
            complition (([], ""))
            downloadGroup.leave()
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            print("Task completion start")
            guard let data = data else {
                print("Wrong Data")
                complition (([], ""))
                self.downloadGroup.leave()
                return }
            //                print("Data = \(data)")
            //                print("JSON String: \(String(describing: String(data: data, encoding: .utf8)))")
            let decoder = JSONDecoder()
            do {
                let item = try decoder.decode(Exoplanets.self, from: data)
                
                for item in item.results ?? [] {
                    self.namesArray.append(item.name ?? "N/A")
                }
                
                complition((self.namesArray, item.next))
            } catch {
                print(error)
                complition(([], ""))
                self.downloadGroup.leave()
                return }
            print("Task completion stop")
            self.downloadGroup.leave()
            
            
            
            //                print("Load Data: next = \(item?.next ?? "")")
        }
        //        }
        task.resume()
    }
    
    func load(complition: ([String]) -> ()) {
        var page = 1
        nextLink = baseLink
        repeat {
            print("Downloading page \(page)")
            downloadGroup.enter()
            loadPage(link: nextLink) { (pageNames) in
            self.resultingNamesArray = pageNames.0
            self.nextLink = pageNames.1
            }
            page += 1
            downloadGroup.wait()
        } while nextLink != nil
        complition(resultingNamesArray)
        print("Downloading is finished")
    }
}
