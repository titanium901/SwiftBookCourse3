
//
//  ToDoViewController.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    
    // MARK: - @IBOutlet
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    
     // MARK: - Stored Properties
    var todo: ToDoClass?
    
    var isPickerHidden = true {
        didSet {
            if oldValue != isPickerHidden {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
    }
    

    // MARK: - UITableViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        dueDatePicker.date = Date().addingTimeInterval(24 * 60 * 60)
        setupNavBar()
        updateSaveButtonState()
        updateDateLabel(date: dueDatePicker.date)
        updateUI()
        textEditingChanged(titleTextField)
        setupToolBarDoneButton()
       
        
       
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //удаляю объект и дезейблю cancel button так как при любом нажатии на save добавляется новый объет
        //в дальнейшем надеюсь найти решение изящней 
        if navigationItem.title == "Edit To Do" {
            try! ToDoClass.realm.write {
                ToDoClass.realm.delete(todo!)
            }
            cancelButton.isEnabled = false
        }
    }
    
    // MARK: - Method
    func updateDateLabel(date: Date) {
        dueDateLabel.text = ToDoClass.dueDateFormatter.string(from: date)
    }
    
    func updateUI() {
        titleTextField.text = todo?.title ?? ""
        isCompleteButton.isSelected = todo?.isComplete ?? false
        notesTextView.text = todo?.notes ?? ""
        if let todoDate = todo?.dueDate {
            dueDateLabel.text = "\(todoDate)"
        } else {
            dueDateLabel.text = ""
        }
    }
    
    func updateSaveButtonState() {
        if (titleTextField.text ?? "").isEmpty {
            saveButton.isEnabled = false
        } else {
            saveButton.isEnabled = true
        }
        
    }
    
    // MARK: - @IBAction
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
            updateDateLabel(date: dueDatePicker.date)
    }
    
    @IBAction func isCompleteButton(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
        isPickerHidden = true
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
        
        isPickerHidden = true
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
        print(#function)
        isPickerHidden = true
    }
    
    
    //MARK: -Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveSegue" else { return }
        
        let title = titleTextField.text ?? ""
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        todo = ToDoClass(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
        //struct
//        todo = ToDoClass(title: titleTextField.text ?? "",
//                    isComplete: isCompleteButton.isSelected,
//                    dueDate: dueDatePicker.date,
//                    note: notesTextView.text ?? "")
    }
    
    
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.blackTranslucent
        navigationItem.leftBarButtonItem?.tintColor = .white
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
}

extension ToDoViewController {
    func setupToolBarDoneButton() {
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        self.titleTextField.inputAccessoryView = toolbar
        self.notesTextView.inputAccessoryView = toolbar
//        self.emailTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    
}


