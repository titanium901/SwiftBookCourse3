//
//  ViewController.swift
//  lesson14
//
//  Created by Yury Popov on 21/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    var mainView: WeatherView! { return self.view as! WeatherView }
    
    
    
    let presenter: WeatherPresenter!
    
    init(with presenter: WeatherPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mainView.celsiusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        mainView.fahrenheitButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    override func loadView() {
        self.view = WeatherView(frame: UIScreen.main.bounds)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        print(#function)
        switch sender.currentTitle {
        case "°C":
            mainView.backgroundView.backgroundColor = .red
            mainView.fahrenheitButton.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
            mainView.cityLabel.text = "Москва"
            mainView.cityLabel.font = UIFont.systemFont(ofSize: 40)
            mainView.conditionsLabel.text = "Солнечно"
            mainView.conditionsLabel.font = UIFont.systemFont(ofSize: 20)
            mainView.temperatureLabel.text = "22°"
            mainView.conditionsImageView.isHidden = false
            mainView.celsiusButton.setTitleColor(.white, for: .normal)
        case "°F":
            mainView.backgroundView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
            mainView.fahrenheitButton.setTitleColor(.white, for: .normal)
            mainView.cityLabel.text = "Winterfall"
            mainView.cityLabel.font = UIFont(name: "GillSans", size: 60)
            mainView.conditionsLabel.text = "Winter is Coming"
            mainView.conditionsLabel.font = UIFont(name: "GillSans", size: 40)
            mainView.temperatureLabel.text = "🥶"
            mainView.conditionsImageView.isHidden = true
            mainView.celsiusButton.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: .normal)
            
        default:
            break
        }
    }

}



