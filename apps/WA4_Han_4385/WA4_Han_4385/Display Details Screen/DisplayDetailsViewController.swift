//
//  DisplayDetailsViewController.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class DisplayDetailsViewController: UIViewController{
    
    var delegate: ViewController!
    var currentIndexPath: IndexPath!
    
    //MARK: creating instance of DisplayView...
    let displayScreen = DisplayDetailsView();
    
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = displayScreen
    }
    
    var receivedContact: Contact = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit, target: self,
            action: #selector(onButtonEditTapped)
        )
        
        displayData()
    }
    
    func displayData() {
        // Safely unwrap and set the image
        if let image = receivedContact.pickedImage {
            displayScreen.imagePhoto.image = image
        } else {
            displayScreen.imagePhoto.image = UIImage(systemName: "person.circle") // Default placeholder image
        }
        
        // Set text fields if they are not empty
        if let name = receivedContact.name, !name.isEmpty {
            displayScreen.labelName.text = name
        } else {
            displayScreen.labelName.text = "No Name Provided"
        }
        
        if let email = receivedContact.email, !email.isEmpty {
            displayScreen.labelEmail.text = "Email: \(email)"
        } else {
            displayScreen.labelEmail.text = "No Email Provided"
        }
        
        if let phoneType = receivedContact.phoneType,
           let phoneNumber = receivedContact.phoneNumber, !phoneNumber.isEmpty {
            displayScreen.labelPhone.text = "Phone: \(phoneNumber) (\(phoneType))"
        } else {
            displayScreen.labelPhone.text = "No Phone Number Provided"
        }
        
        if let address = receivedContact.address, !address.isEmpty {
            displayScreen.labelAddress.text = address
        } else {
            displayScreen.labelAddress.text = "No Address Provided"
        }
        
        if let cityAndState = receivedContact.cityAndState, !cityAndState.isEmpty {
            displayScreen.labelCityAndState.text = cityAndState
        } else {
            displayScreen.labelCityAndState.text = "No City/State Provided"
        }
        
        if let zip = receivedContact.zip, !zip.isEmpty {
            displayScreen.labelZip.text = zip
        } else {
            displayScreen.labelZip.text = "No Zip Code Provided"
        }
    }
    
    @objc func onButtonEditTapped(){
        let editDetailsViewController = EditDetailsViewController()
        editDetailsViewController.delegate = self
        editDetailsViewController.receivedContact = receivedContact
        print("Image passed to Edit Screen: \(String(describing: receivedContact.pickedImage))")

        navigationController?.pushViewController(editDetailsViewController, animated: true)
    }
    
    //MARK: got the new contact back and delegated to ViewController...
    func delegateOnAddContact(contact: Contact) {
        receivedContact = contact
        displayData() // update itself
        delegate.updateTableView(update: currentIndexPath, updateContact: receivedContact) // update main screen
    }
}

