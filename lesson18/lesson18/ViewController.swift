//
//  ViewController.swift
//  lesson18
//
//  Created by Yury Popov on 29/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit
import MessageUI
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - IB Actions
    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        
        let activityController = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        
        present(activityController, animated: true)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        let url = URL(string: "https://lapkins.ru/dog/velsh-korgi-pembrok/")!
        
        let safariViewController = SFSafariViewController(url: url)
        
        present(safariViewController, animated: true)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                print(#function, "Camera selected")
                // TODO: TODO: Implement camera selection
            }
            alertController.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        
        present(alertController, animated: true)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print(#line, #function, "Can not send e-mail")
            let alertMessage = UIAlertController(title: "Email unavailable", message: "Device is not able to send Emails", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertMessage, animated: true, completion: nil)
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["yuriy901@swiftbook.ru"])
        mailComposer.setMessageBody("Hello!", isHTML: false)
        
        present(mailComposer, animated: true)
    }
    
    @IBAction func messageButtonTapped(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendAttachments() else {
            // не способно отправлять SMS
            let alertMessage = UIAlertController(title: "SMS unavailable", message: "Device is not able to send SMS", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alertMessage, animated: true, completion: nil)
            return
        }
        
        // способно отправлять SMS
        let messageController = MFMessageComposeViewController()
        messageController.messageComposeDelegate = self
        
        // номер получателя смс
        messageController.recipients = ["000 123 44 55"]
        // сообщение получателю
        messageController.body = "Just sent!"
        // показываем messageController
        present(messageController, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let data = info[UIImagePickerController.InfoKey.originalImage] else { return }
        let image = data as? UIImage
        imageView.image = image
        dismiss(animated: true)
    }
}

// MARK: - MFMailComposeViewControllerDelegate
extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        // обработчик результатов
        switch result.rawValue {
        // пользователь прервал отправку сообщения
        case MessageComposeResult.cancelled.rawValue: print("Cancel")
        // пользователем отправка сообщения была неудачной
        case MessageComposeResult.failed.rawValue:
            let alertMessage = UIAlertController(title: "Error", message: "Failed to send message", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(controller, animated: true, completion: nil)
            //  presentedViewController(alertMessage, alertMessage: true, completion: nil)
        // пользователь отправил сообщение
        case MessageComposeResult.sent.rawValue: print("Sent")
        default: print("Error"); break
        }
        // прячем messageComposeViewController
        dismiss(animated: true, completion: nil)
    }
    
    
    
}


