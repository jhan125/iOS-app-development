//
//  EditScreenViewController.swift
//  WA6_Han_4385
//
//  Created by Jiali Han on 10/21/24.
//

import UIKit

// Edit Contact: Preloading data of the contact that is getting edited
// API calls and handling responses to update a current contact and reflect the changes on the main contact list using the Notification Center
class EditScreenViewController: UIViewController {
    
    let displayScreen = EditScreenView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    var contactDetail: Contact?
    var originalName: String?

    override func loadView() {
        view = displayScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        //MARK: add action to ButtonDelete
        displayScreen.ButtonSave.addTarget(
            self,
            action: #selector(onButtonSaveTapped),
            for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: Setup View with Contact Details
    func setupView() {
        if let contact = contactDetail {
            originalName = contact.name
            displayScreen.textFieldName.text = contact.name
            displayScreen.textFieldEmail.text = contact.email
            displayScreen.textFieldPhone.text = String(contact.phone)
        }
    }
    
    //MARK: Handle Save Button Tap
    @objc func onButtonSaveTapped() {
        // safely unwrap all the values
        guard let unwrappedOriginalName = originalName,
              let unwrappedName = displayScreen.textFieldName.text,
              let unwrappedEmail = displayScreen.textFieldEmail.text,
              let unwrappedPhone = displayScreen.textFieldPhone.text else {
            return
        }
        // validate fields before saving
        if unwrappedName.isEmpty {
            EmptyError(fieldName: "Name")
        } else if unwrappedEmail.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(unwrappedEmail) {
            otherError(content: "Email Address is invalid")
        } else if unwrappedPhone.isEmpty {
            EmptyError(fieldName: "Phone Number")
//        } else if unwrappedPhone.count != 10 {
//            otherError(content: "Phone number must be 10 digits")
        } else {
            // create the Contact object after validation
            if let contact = convertData(name: unwrappedName, email: unwrappedEmail, phone: unwrappedPhone) {
                
                // post notification with the original and updated contact info
                postNotificationForContactEdit(unwrappedOriginalName: unwrappedOriginalName, updatedContact: contact)
                
                // navigate back to detail screen
                // Reference: https://piazza.com/class/m0n2wvk1b0y6o8/post/239
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    //MARK: Post Notification with Edited Contact
    func postNotificationForContactEdit(unwrappedOriginalName: String, updatedContact: Contact) {
        let notificationArray = "EDIT,\(unwrappedOriginalName),\(updatedContact.name),\(updatedContact.email),\(updatedContact.phone)"
        notificationCenter.post(name: Notification.Name("orderFromDetailScreen"), object: notificationArray)
    }
    
    //MARK: Convert Data to Contact (Helper function for validation)
    func convertData(name: String, email: String, phone: String) -> Contact? {
        if name.isEmpty {
            EmptyError(fieldName: "Name")
        } else if email.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(email) {
            otherError(content: "Invalid email format")
        } else if phone.isEmpty {
            EmptyError(fieldName: "Phone")
        } 
//        else if phone.count != 10 {
//            otherError(content: "Phone number must be 10 digits")
//        } 
        else {
            // return the new Contact object after validation
            return Contact(name: name, email: email, phone: Int(phone)!)
        }
        return nil
    }
    
    func EmptyError(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "The \(fieldName) cannot be empty!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func otherError(content: String) {
        let alert = UIAlertController(title: "Error!", message: content, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    // Citation: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
}
