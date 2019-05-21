//
//  WeatherPresenter.swift
//  lesson14
//
//  Created by Yury Popov on 21/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

protocol WeatherPresenter {
    var backgroundColors: [CGColor] { get }
}

class WeatherPresenterImpl: WeatherPresenter {
    var backgroundColors: [CGColor] {
        
        return sunnyColors
    }
    
    private let sunnyColors: [CGColor] = {
        return [UIColor.sunnyTop.cgColor, UIColor.sunnyBottom.cgColor]
    }()
    
    private let snowyColors: [CGColor] = {
        return [UIColor.snowyTop.cgColor, UIColor.snowyBottom.cgColor]
    }()
}
