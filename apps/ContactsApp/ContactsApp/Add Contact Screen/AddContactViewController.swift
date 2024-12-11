//
//  AddContactViewController.swift
//  ContactsApp
//
//  Created by Jiali Han on 11/5/24.
//

import UIKit
import FirebaseAuth // to access the details of the current user
import FirebaseFirestore // to store data & upload/read data using Swift Codable structs.

class AddContactViewController: UIViewController {
    var currentUser:FirebaseAuth.User?
    
    let addContactScreen = AddContactView()
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = addContactScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Add a New Contact"
        
        addContactScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
    }
    
    //MARK: on add button tapped....
    @objc func onAddButtonTapped(){
        let name = addContactScreen.textFieldName.text
        let email = addContactScreen.textFieldEmail.text
        let phoneText = addContactScreen.textFieldPhone.text
        
        if name == "" || email == "" || phoneText == ""{
            //alert..
        }else{
            if let phone = Int(phoneText!) {
                let contact = Contact(name: name!, email: email!, phone: phone)
                
                saveContactToFireStore(contact: contact)
            }
        }
        
    }
    
    //MARK: logic to add a contact to Firestore...
    func saveContactToFireStore(contact: Contact){
        if let userEmail = currentUser!.email{
            // create a reference to the collection for the contacts of the current user
            let collectionContacts = database
                .collection("users")
                .document(userEmail)
                .collection("contacts")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            do{
                try collectionContacts.addDocument(from: contact, completion: {(error) in
                    if error == nil{
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()
                        
                        self.navigationController?.popViewController(animated: true)
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    
    }
        
}

//MARK: add the progress indicator view when storing the contact in Firestore
extension AddContactViewController:ProgressSpinnerDelegate{
    func showActivityIndicator(){
        addChild(childProgressView)
        view.addSubview(childProgressView.view)
        childProgressView.didMove(toParent: self)
    }
    
    func hideActivityIndicator(){
        childProgressView.willMove(toParent: nil)
        childProgressView.view.removeFromSuperview()
        childProgressView.removeFromParent()
    }
}
