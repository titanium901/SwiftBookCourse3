//
//  RickAndMortyController.swift
//  lesson22
//
//  Created by Yury Popov on 05/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class RickAndMortyController {
    
    static let shared = RickAndMortyController()
    
    private init() {}
    
    func fetchRickAndMortyData(url: URL?, completion: @escaping (RickAndMorty?) -> Void) {
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            guard let rickAndMorty = try? jsonDecoder.decode(RickAndMorty.self, from: data) else {
                completion(nil)
                return
            }
            
            completion(rickAndMorty)
            
            
            }.resume()
    }
    
}
