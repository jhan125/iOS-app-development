//
//  ViewController.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class ViewController: UIViewController {

    var contacts = [Contact]()
        
    let mainScreen = MainScreenView()
    
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "My Contacts"
        
        //MARK: patching the table view delegate and datasource to controller...
        mainScreen.tableViewContact.delegate = self
        mainScreen.tableViewContact.dataSource = self
        
        // Customize the navigation bar title font size and attributes
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ]
        
        // Create a custom back button for the left side
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        navigationItem.backBarButtonItem = backButton

        // Reference: Piazza's post https://piazza.com/class/m0n2wvk1b0y6o8/post/136
        // Disable the table view separator
        mainScreen.tableViewContact.separatorStyle = .none
        // Center the content of the table view cells
        mainScreen.tableViewContact.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        // Register the UITableViewCell with the identifier "contacts"
        mainScreen.tableViewContact.register(TableViewContactCell.self, forCellReuseIdentifier: "contacts")
                                
        //MARK: setting the SAVE button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
        
    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
       
    //MARK: got the new contact back and delegated to ViewController...
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        mainScreen.tableViewContact.reloadData()
    }
    
    func updateTableView(update indexPath: IndexPath, updateContact: Contact) {
        self.contacts[indexPath.row] = updateContact
        mainScreen.tableViewContact.reloadData()
    }
}
       
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: return the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // checks if it already has a reusable empty cell with the identifier provided. If yes, it will reuse that; else, it will create a new cell of that identifier.
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        
        guard let uwName = contacts[indexPath.row].name,
              let uwImage = contacts[indexPath.row].pickedImage,
              let uwEmail = contacts[indexPath.row].email,
              let uwPhoneNum = contacts[indexPath.row].phoneNumber,
              let uwPhoneType = contacts[indexPath.row].phoneType
        else {
            return cell
        }
        
        cell.labelName.text = "\(uwName)"
        cell.labelEmail.text = "\(uwEmail)"
        cell.labelPhone.text = "\(uwPhoneNum) (\(uwPhoneType))"
        cell.imagePhoto.image = uwImage
        
        return cell
    }
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Dequeue the cell with the identifier "contacts"
        let displayDetailsViewController = DisplayDetailsViewController()
        displayDetailsViewController.receivedContact = self.contacts[indexPath.row]
        displayDetailsViewController.delegate = self
        displayDetailsViewController.currentIndexPath = indexPath
    
        navigationController?.pushViewController(displayDetailsViewController, animated: true)
        
        // debug
//        print("Selected contact image: \(String(describing: contacts[indexPath.row].pickedImage))")
    }
}
