//
//  ViewController.swift
//  lesson22
//
//  Created by Yury Popov on 05/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var id = 1
    var url = URL(string: "https://rickandmortyapi.com/api/character/1")!
    var rickAndMorty: RickAndMorty? {
        didSet {
            updateUI()
        }
    }
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.width / 2
        requestData()
        setupToolBarDoneButton()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
    
    func requestData() {
        RickAndMortyController.shared.fetchRickAndMortyData(url: url) { (rickAndMorty) in
            guard let rickAndMorty = rickAndMorty else { return }
            self.rickAndMorty = rickAndMorty
        }
    }
    
    func updateUI() {
        guard let rickAndMorty = rickAndMorty else { return }
        
        DispatchQueue.main.async {
            self.nameLabel.text = rickAndMorty.name
            self.statusLabel.text = rickAndMorty.status
            self.genderLabel.text = rickAndMorty.gender
            self.idLabel.text = String(rickAndMorty.id)
        }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: rickAndMorty.image) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
            }
        }
    }

    @IBAction func nextButton(_ sender: UIButton) {
        
        let idId = (rickAndMorty?.id ?? 0) + id
        if idId > 394 {
            idTextField.text = "No More Characters"
            return
        }
        url = URL(string: "https://rickandmortyapi.com/api/character/" + "\(String(idId))")!
        requestData()
        self.view.endEditing(true)
    }
    
}

