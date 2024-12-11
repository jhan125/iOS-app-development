//
//  ContactDetailViewController.swift
//  WA6_Han_4385
//
//  Created by Jiali Han on 10/21/24.
//

import UIKit

// Display Screen: API call, request creation, and response handling
class ContactDetailViewController: UIViewController {
    let displayScreen = ContactDetailView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    var contactDetail: Contact?
    
    override func loadView() {
        view = displayScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // MARK: Set up the navigation bar button
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(onEditBarButtonTapped)
        )
        
        //MARK: Add action to ButtonDelete
        displayScreen.ButtonDelete.addTarget(
            self,
            action: #selector(onButtonDeleteTapped),
            for: .touchUpInside
        )
        
        // MARK: Add observer to listen for contact edits
        notificationCenter.addObserver(
            self,
            selector: #selector(contactEdited(notification:)),
            name: Notification.Name("orderFromDetailScreen"),
            object: nil
        )
    }
    
    func setupView() {
        if let unwrappedContact = contactDetail {
            displayScreen.labelName.text = unwrappedContact.name
            displayScreen.labelEmail.text = unwrappedContact.email
            displayScreen.labelPhone.text = String(unwrappedContact.phone)
        }
    }
    
    // when editing the contact
    @objc func onEditBarButtonTapped(){
        let editScreen = EditScreenViewController()
        editScreen.contactDetail = contactDetail
        // Push the edit view controller
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    // when the contact is edited (Notification receiver)
    @objc func contactEdited(notification: Notification) {
        // parse the updated contact details from the notification
        if let notificationString = notification.object as? String {
            
            let components = notificationString.split(separator: ",").map { String($0) }
            
            if components.count == 5, components[0] == "EDIT" {
                
                let updatedContact = Contact(name: components[2], email: components[3], phone: Int(components[4])!)
                
                // update the contact detail and refresh the UI
                self.contactDetail = updatedContact
                
                // refresh the UI with updated contact details
                setupView()
            }
        }
    }
    
    // Delete contact
    // Asking users to confirm the deletion of the contact before calling the API
    // API calls and handling responses to delete a current contact and reflect the changes on the main contact list
    @objc func onButtonDeleteTapped(){
        let alert = UIAlertController(
            title: "Caution!",
            message: "Are you sure to delete this Contact",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: "Delete",
            style: .destructive,
            handler: {
                (action: UIAlertAction!)  in
                if let unwarppedName =  self.displayScreen.labelName.text {
                    let text = "DELETE" + "," + unwarppedName
                    self.notificationCenter.post(
                        name: Notification.Name("orderFromDetailScreen"),
                        object: text)
                }
                self.navigationController?.popViewController(animated: true)
            }
        ))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        self.present(alert, animated: true)
        
    }
    
    // remove the observer when the view is deallocated
    deinit {
        notificationCenter.removeObserver(self)
    }
}
