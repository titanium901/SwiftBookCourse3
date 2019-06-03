//
//  String+Extension.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

extension String {
    var name: String {
        return components(separatedBy: "/").last ?? ""
    }
}
