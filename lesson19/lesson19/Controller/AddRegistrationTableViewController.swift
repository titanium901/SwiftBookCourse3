//
//  AddRegistrationTableViewController.swift
//  lesson19
//
//  Created by Yury Popov on 30/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var adultsGuestLabel: UILabel!
    @IBOutlet weak var childrenGuestLabel: UILabel!
    
    @IBOutlet weak var nameOfRoomLabel: UILabel!
    @IBOutlet weak var priceOfRoomLabel: UILabel!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet weak var wifiLabel: UILabel!
    
    
    var room = RoomType(id: 0, name: "", shortName: "", price: 0)
    
    
    let checkInDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    
    let checkOutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerShown
        }
    }
    var isCheckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerShown
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnigtToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnigtToday
        checkInDatePicker.date = midnigtToday
        updateDateViews()
        setup()
        checkBeforeDone()
        setupToolBarDoneButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        checkBeforeDone()

    }
    
    
    func setup() {
        doneButton.isEnabled = false
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.emailTextField.delegate = self
        
    }
    
    func updateDateViews() {
        checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(24 * 60 * 60)
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        checkInDateLabel.text = dateFormater.string(from: checkInDatePicker.date)
        checkOutDateLabel.text = dateFormater.string(from: checkOutDatePicker.date)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        print(#function)
        guard segue.identifier == "saveSegue" else { return }
        guard let roomVC = segue.source as? RoomTypeTableViewController else { return }
        room = roomVC.room
        nameOfRoomLabel.text = room.name
        priceOfRoomLabel.text = String(room.price) + " $"
        
        
        
    }
    
    @IBAction func checkBeforeDone() {
        
        if ((firstNameTextField.text ?? "").isEmpty) || ((lastNameTextField.text ?? "").isEmpty) || ((emailTextField.text ?? "").isEmpty) || room.id == 0 || !(emailTextField.text?.isValidEmail() ?? false) {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }

    
    @IBAction func buttonPressed() {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(adultsGuestLabel.text!)!
        let numberOfChildren = Int(childrenGuestLabel.text!)!
        let wifi = wifiSwitch.isOn
       
        
        let registration = Registration(
                                        firstName: firstName,
                                        lastName: lastName,
                                        emailAdress: email,
                                        
                                        checkInDate: checkInDate,
                                        checkOutDate: checkOutDate,
                                        numberOfAdults: numberOfAdults,
                                        numberOfChildren: numberOfChildren,
                                        
                                        roomType: room,
                                        wifi: wifi)
        print(#function, registration)
        
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    @IBAction func wifiSwitch(_ sender: UISwitch) {
        sender.isOn ? (wifiLabel.text = "On") : (wifiLabel.text = "Off")
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        switch sender.tag {
        case 0:
            adultsGuestLabel.text = String(Int(sender.value))
        case 1:
            childrenGuestLabel.text = String(Int(sender.value))
        default:
            break
        }
        
    }
    
    
}

extension AddRegistrationTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerIndexPath:
            return isCheckInDatePickerShown ? 216 : 0
        case checkOutDatePickerIndexPath:
            return isCheckOutDatePickerShown ? 216 : 0
        default:
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInDateLabelIndexPath:
            if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
            } else if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
                isCheckInDatePickerShown = true
            } else {
                isCheckInDatePickerShown = true
            }
        case checkOutDateLabelIndexPath:
            if isCheckOutDatePickerShown {
                isCheckOutDatePickerShown = false
            } else if isCheckInDatePickerShown {
                isCheckInDatePickerShown = false
                isCheckOutDatePickerShown = true
            } else {
                isCheckOutDatePickerShown = true
            }
        default:
            break
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension AddRegistrationTableViewController: UITextFieldDelegate {
    
    //скрывать клавиатуру на ретурн + добавить делегатов в setup на текстовые поля
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        
        return true
        
    }
    
}

extension AddRegistrationTableViewController {
    //done button
    func setupToolBarDoneButton() {
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        self.firstNameTextField.inputAccessoryView = toolbar
        self.lastNameTextField.inputAccessoryView = toolbar
        self.emailTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
}
//check is email or not
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
