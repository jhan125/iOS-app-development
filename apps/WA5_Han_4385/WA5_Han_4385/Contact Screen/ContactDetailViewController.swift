//
//  ContactDetailViewController.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class ContactDetailViewController: UIViewController {

    let displayScreen = ContactDetailView();
        var delegate: ViewController!;
        var currentIndexPath: IndexPath!;
        
        override func loadView() {
            view = displayScreen
        }
        
        var receivedContacts: Contacts = Contacts()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .edit, target: self,
                action: #selector(onAddBarButtonTapped)
            )
            displayData()
        }
        
        func displayData() {
            //MARK: setting the Labels' texts...
            if let unwrappedName = receivedContacts.name{
                if !unwrappedName.isEmpty{
                    displayScreen.labelName.text = unwrappedName
                }
            }
            
            if let unwrappedEmail = receivedContacts.email{
                if !unwrappedEmail.isEmpty{
                    displayScreen.labelEmail.text = "Email: \(unwrappedEmail)"
                }
            }
            
            displayScreen.imagePhoto.image = receivedContacts.pickedImage!
            
            let unwrappedPhoneType = receivedContacts.phoneType!
            let unwrappedPhoneNumber = receivedContacts.phoneNumber!
            
            if !unwrappedPhoneNumber.isEmpty{
                displayScreen.labelPhone.text = "Phone: \(unwrappedPhoneNumber) (\(unwrappedPhoneType))"
            }
            
            if let unwrappedAddress = receivedContacts.address{
                if !unwrappedAddress.isEmpty{
                    displayScreen.labelAddress.text = unwrappedAddress
                }
            }
            
            if let unwrappedCityAndState = receivedContacts.cityAndState{
                if !unwrappedCityAndState.isEmpty{
                    displayScreen.labelCityAndStates.text = "\(unwrappedCityAndState)"
                }
            }
            
            if let unwrappedZip = receivedContacts.zip{
                if !unwrappedZip.isEmpty{
                    displayScreen.labelZip.text = unwrappedZip
                }
            }
        }
        
        @objc func onAddBarButtonTapped(){
            let editScreenControllor = EditScreenController()
            editScreenControllor.delegate = self
            editScreenControllor.receivedContacts = receivedContacts
            navigationController?.pushViewController(editScreenControllor, animated: true)
        }
        
        //MARK: got the new expense back and delegated to ViewController...
        func delegateOnAddContact(Contact: Contacts){
            receivedContacts = Contact
            displayData() // update itself
            delegate.updateTableView(update: currentIndexPath, updateContacts: receivedContacts) // update first screen
        }

    }
