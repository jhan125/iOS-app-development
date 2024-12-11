//
//  ViewController.swift
//  WA6_Han_4385
//
//  Created by Jiali Han on 10/21/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    let notificationCenter = NotificationCenter.default
    
    //MARK: list to display the contact names in the TableView...
    var contactNames = [String]()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getAllContacts()
        addObservers()
    }
    
    private func setupUI() {
        title = "My Contacts"
        
        // Setup TableView
        // setting the delegate and data source...
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        // removing the separator line...
        mainScreen.tableViewContacts.separatorStyle = .none
        
        // Add action to Add Contact button
        mainScreen.buttonAdd.addTarget(
            self,
            action: #selector(onButtonAddTapped),
            for: .touchUpInside
        )
    }
    
    private func addObservers() {
        notificationCenter.addObserver(self,
                                       selector: #selector(handleDetailScreenModification(notification:)),
                                       name: Notification.Name("orderFromDetailScreen"),
                                       object: nil)
    }
    
    @objc private func onButtonAddTapped() {
        guard let name = mainScreen.textFieldAddName.text,
              let email = mainScreen.textFieldAddEmail.text,
              let phone = mainScreen.textFieldAddPhone.text else {
            showAlert(title: "Error", message: "All fields must be filled.")
            return
        }
        
        if let contact = createContactFromInput(name: name, email: email, phone: phone) {
            addNewContact(contact: contact)
        }
    }
   
    private func getAllContacts() {
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                let names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print("Get All Contacts Error: ", data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print("Get All Contacts Error: ", data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print("Network Error: ", error)
                    break
                }
            })
        }
    }
    
    private func addNewContact(contact: Contact) {
        if let url = URL(string: APIConfigs.baseURL+"add"){
                  
                  AF.request(url, method:.post, parameters:
                              [
                                  "name": contact.name,
                                  "email": contact.email,
                                  "phone": contact.phone
                              ])
                      .responseString(completionHandler: { response in
                          //MARK: retrieving the status code...
                          let status = response.response?.statusCode
                          
                          switch response.result{
                          case .success(let data):
                              //MARK: there was no network error...
                              
                              //MARK: status code is Optional, so unwrapping it...
                              if let uwStatusCode = status{
                                  switch uwStatusCode{
                                      case 200...299:
                                      //MARK: the request was valid 200-level...
                                          print("Contact Added:", data)
                                          self.getAllContacts()
                                          self.clearAddViewFields()
                                          break
                              
                                      case 400...499:
                                      //MARK: the request was not valid 400-level...
                                          print("Add Contact Error: ", data)
                                          break
                              
                                      default:
                                      //MARK: probably a 500-level error...
                                          print("Add Contact Error: ", data)
                                          break
                              
                                  }
                              }
                              break
                              
                          case .failure(let error):
                              //MARK: there was a network error...
                              print("Network Error: ", error)
                              break
                          }
                      })
              }else{
                  showAlert(title: "Error", message: "Invalid URL for adding a contact.")
                             return
              }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    func editContact(originalName: String, updatedContact: Contact) {
        deleteContact(contactName: originalName) {
            self.addNewContact(contact: updatedContact)
        }
    }
    
    func deleteContact(contactName: String, completion: @escaping () -> Void = {}) {
        guard let url = URL(string: APIConfigs.baseURL + "delete") else {
            showAlert(title: "Error", message: "Invalid URL for deleting a contact.")
            return
        }
        
        AF.request(url, method: .get, parameters: ["name": contactName], encoding: URLEncoding.queryString)
            .responseString { response in
                switch response.result {
                case .success(let data):
                    if let statusCode = response.response?.statusCode, (200...299).contains(statusCode) {
                        print("Contact Deleted:", data)
                        self.getAllContacts()
                        completion()
                    } else {
                        print("Delete Error:", data)
                    }
                case .failure(let error):
                    print("Network Error:", error)
                }
            }
    }
    
    private func createContactFromInput(name: String, email: String, phone: String) -> Contact? {
        if name.isEmpty {
            showAlert(title: "Error", message: "Name cannot be empty.")
        } else if email.isEmpty {
            showAlert(title: "Error", message: "Email cannot be empty.")
        } else if !isValidEmail(email) {
            showAlert(title: "Error", message: "Invalid email format.")
        } else if phone.isEmpty {
            showAlert(title: "Error", message: "Phone number cannot be empty.")
        } 
        // No need to validate the count of phone numbers
        // Reference: https://piazza.com/class/m0n2wvk1b0y6o8/post/252
//        else if phone.count != 10 {
//            showAlert(title: "Error", message: "Phone number must be 10 digits.")
//        } 
        else {
            return Contact(name: name, email: email, phone: Int(phone)!)
        }
        return nil
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func handleDetailScreenModification(notification: Notification) {
        guard let notificationString = notification.object as? String else { return }
        
        let details = notificationString.split(separator: ",").map { String($0) }
        if details.count >= 2 {
            switch details[0] {
            case "DELETE":
                deleteContact(contactName: details[1])
            case "EDIT":
                if details.count == 5, let phone = Int(details[4]) {
                    let updatedContact = Contact(name: details[2], email: details[3], phone: phone)
                    editContact(originalName: details[1], updatedContact: updatedContact)
                }
            default:
                break
            }
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        fetchContactDetails(name: contactNames[indexPath.row])
    }
    
    // Fetches contact details and navigates to the detail view
    private func fetchContactDetails(name: String) {
        guard let url = URL(string: APIConfigs.baseURL + "details") else {
            showAlert(title: "Error", message: "Invalid URL for fetching contact details.")
            return
        }
        
        AF.request(url, method: .get, parameters: ["name": name], encoding: URLEncoding.queryString)
            .responseString { response in
                switch response.result {
                case .success(let data):
                    if let statusCode = response.response?.statusCode, (200...299).contains(statusCode) {
                        self.navigateToDetailScreen(data: data)
                    } else {
                        print("Detail Fetch Error:", data)
                    }
                case .failure(let error):
                    print("Network Error:", error)
                }
            }
    }
    
    // Navigate to the contact detail view
    private func navigateToDetailScreen(data: String) {
        let parts = data.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        guard parts.count == 3, let phone = Int(parts[2]) else {
            print("Invalid contact data format.")
            return
        }
        
        let contact = Contact(name: parts[0], email: parts[1], phone: phone)
        let detailViewController = ContactDetailViewController()
        detailViewController.contactDetail = contact
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
