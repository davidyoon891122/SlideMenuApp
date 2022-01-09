//
//  ApiService.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/09.
//

import Foundation

class ApiService: NSObject {
    static let shardInstance = ApiService()
    
    func fetchVideos(completion:@escaping ([Video]) -> ()) {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print(error ?? "Error")
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let jsonData = try JSONDecoder().decode([Video].self, from: data)
                
                DispatchQueue.main.async {
                   completion(jsonData)
                }
                
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}
