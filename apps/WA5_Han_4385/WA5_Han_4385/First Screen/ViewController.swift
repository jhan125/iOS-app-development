//
//  ViewController.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var ContactsList = [Contacts]()
    
    let mainScreen = FirstScreenView()
    
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "My Contacts"
        
        //MARK: patching the table view delegate and datasource to controller...
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.dataSource = self
        
        
        // Test Part
        // let Contact1 = Contacts(name: "Xu", email: "123@qq.com", phoneType: "Cell", phoneNumber: "5173038185", address: "645 N Fair Oak Ave", cityAndState: "Mountain View, CA", zip: "93096", pickedImage: UIImage(systemName: "hand.thumbsup.circle.fill"))
        // ContactsList.append(Contact1)
    
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
    }

    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
    
    //MARK: got the new expense back and delegated to ViewController...
    func delegateOnAddContact(Contact: Contacts){
        ContactsList.append(Contact)
        mainScreen.tableViewContacts.reloadData()
    }
    
    func updateTableView(update indexPath: IndexPath, updateContacts: Contacts) {
        self.ContactsList[indexPath.row] = updateContacts
        mainScreen.tableViewContacts.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsList.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsList", for: indexPath) as! TableViewContactsCell
        cell.imagePhoto.image = ContactsList[indexPath.row].pickedImage
        cell.labelNameTitle.text = ContactsList[indexPath.row].name
        cell.labelEmail.text = ContactsList[indexPath.row].email
        cell.labelPhone.text = ContactsList[indexPath.row].phoneNumber! + " (" + ContactsList[indexPath.row].phoneType! + ")"
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactDetailScreenController = ContactDetailViewController()
        contactDetailScreenController.receivedContacts = self.ContactsList[indexPath.row]
        contactDetailScreenController.delegate = self
        contactDetailScreenController.currentIndexPath = indexPath
        navigationController?.pushViewController(contactDetailScreenController, animated: true)
    }
    
}
