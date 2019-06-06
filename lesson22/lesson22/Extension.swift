//
//  Extension.swift
//  lesson22
//
//  Created by Yury Popov on 05/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

extension ViewController {
    func setupToolBarDoneButton() {
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        self.idTextField.inputAccessoryView = toolbar
        
        //        self.emailTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
        guard let idFromText = Int(idTextField.text ?? "1") else { return }
        if idFromText > 394 {
            idTextField.text = "No Characters at ID: \(String(describing: idTextField.text!))"
            return
        }
        url = URL(string: "https://rickandmortyapi.com/api/character/" + "\(String(idFromText))")!
        requestData()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
}

