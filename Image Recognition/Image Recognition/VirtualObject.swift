//
//  VirtualObject.swift
//  Image Recognition
//
//  Created by Yury Popov on 20/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import SceneKit

class VirtualObject: SCNReferenceNode {
    
    static let availableObjects: [SCNReferenceNode] = {
        
        guard let modelsURLs = Bundle.main.url(forResource: "art.scnassets", withExtension: nil) else { return [] }
        
        let fileEnumirator = FileManager().enumerator(at: modelsURLs, includingPropertiesForKeys: nil)!
        
        return fileEnumirator.compactMap { element in
            let url = element as! URL
            
            guard url.pathExtension == "scn" else { return nil }
            
            return VirtualObject(url: url)
        }
    }()
}
