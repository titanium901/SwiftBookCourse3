//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Yury Popov on 08/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var answers: [Answer]?
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        
        updateResult(answers: answers!)
   
        
        
    }
    
    func updateResult(answers: [Answer]) {
        var ronaldoCount = 0
        var messiCount = 0
        var vidalCount = 0
        var buffonCount = 0
        
        for index in 0..<answers.count {
            
            switch answers[index].type {
            case .messi:
                messiCount += 1
            case .ronaldo:
                ronaldoCount += 1
            case .vidal:
                vidalCount += 1
            case .buffon:
                buffonCount += 1
            }
        }
        
        if ronaldoCount > max(messiCount, vidalCount, buffonCount) {
            print("Ron")
            playerImage.image = UIImage(named: "ronaldo")
            descriptionLabel.text = PlayerType.ronaldo.definition
        } else if messiCount > max(ronaldoCount, vidalCount, buffonCount) {
            print("Messi")
            playerImage.image = UIImage(named: "leo")
            descriptionLabel.text = PlayerType.messi.definition
        } else if vidalCount > max(ronaldoCount, messiCount, buffonCount) {
            print("Vidal")
            playerImage.image = UIImage(named: "vidal")
            descriptionLabel.text = PlayerType.vidal.definition
        } else if buffonCount > max(ronaldoCount, messiCount, vidalCount) {
            print("Buffon")
            playerImage.image = UIImage(named: "buf")
            descriptionLabel.text = PlayerType.buffon.definition
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
