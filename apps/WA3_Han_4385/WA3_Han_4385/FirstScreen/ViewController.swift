//
//  ViewController.swift
//  WA3_Han_4385
//
//  Created by Jiali Han on 9/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: initializing the First Screen View...
    let firstScreen = FirstScreenView()
    
    // phone types for firstScreen.pickerMood
    let phoneType: [String] = ["Cell", "Work", "Home"]
    
    var selectedType = "Cell"
    
    //MARK: struct to create a package to send to the Display Screen...
    public struct Package {
        var name: String?
        var email: String?
        var phoneType: String?
        var phoneNumber: String?
        var address: String?
        var cityAndState: String?
        var zip: String?
        
        
        init(name: String? = nil, email: String? = nil, phoneType: String? = nil, phoneNumber: String? = nil, address: String? = nil, cityAndState: String? = nil, zip: String? = nil) {
            self.name = name
            self.email = email
            self.phoneType = phoneType
            self.phoneNumber = phoneNumber
            self.address = address
            self.cityAndState = cityAndState
            self.zip = zip
        }
    }
    
    //MARK: add the view to this controller while the view is loading...
    override func loadView() {
        view = firstScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: customize the back button for the next view controller
        let backButton = UIBarButtonItem()
        backButton.title = "Create Profile"
        navigationItem.backBarButtonItem = backButton
        
        //MARK: adding the PickerView delegate and data source...
        firstScreen.pickerPhoneType.delegate = self
        firstScreen.pickerPhoneType.dataSource = self
        
        //MARK: adding action for firstScreen.
        firstScreen.buttonSubmit.addTarget(self, action: #selector(onButtonSubmitTapped), for: .touchUpInside)
    }
    
    //MARK: submit button tapped action...
    @objc func onButtonSubmitTapped(){
        // Safely unwrapping text fields using guard
        // Reference: https://stackoverflow.com/questions/63667226/force-unwrap-after-guard-let
        guard let name = firstScreen.textFieldName?.text, !name.isEmpty else {
           return showEmptyError(fieldName: "Name")
        }
           
        guard let email = firstScreen.textFieldEmail?.text, !email.isEmpty else {
            return showEmptyError(fieldName: "Email")
        }
           
        guard isValidEmail(email) else {
            return showError(content: "Email address is invalid!")
        }
           
        guard let phoneNumber = firstScreen.textFieldPhoneNumber.text, !phoneNumber.isEmpty else {
            return showEmptyError(fieldName: "PhoneNumber")
        }
        
        // phone number follows 10-digit dialing procedure
        // Reference: https://en.wikipedia.org/wiki/Ten-digit_dialing
        guard isValidPhoneNumber(phoneNumber) else {
            return showError(content: "Phone number is invalid!")
        }
           
        guard let address = firstScreen.textFieldAddress.text, !address.isEmpty else {
            return showEmptyError(fieldName: "Address")
        }
           
        guard let cityAndState = firstScreen.textFieldCityAndState.text, !cityAndState.isEmpty else {
            return showEmptyError(fieldName: "City, State")
        }
        
        guard isValidCityAndState(cityAndState) else {
            return showError(content: "City and State is invalid!")
        }
           
        guard let zip = firstScreen.textFieldZip.text, !zip.isEmpty else {
            return showEmptyError(fieldName: "Zip")
        }
        
        // validate if the user put a valid zipcode (exactly five digits long, the current Zip codes in the United States range from 00001 – 99950).
        guard isValidZip(zip) else {
            return showError(content: "Zip number is invalid!")
        }
            
        // Creating the package once all validation checks are passed
        let package = Package(
            name: name,
            email: email,
            phoneType: selectedType,
            phoneNumber: phoneNumber,
            address: address,
            cityAndState: cityAndState,
            zip: zip
        )
        
        // Creating and pushing the display view controller
        let displayViewController = DisplayViewController()
        displayViewController.receivedPackage = package
        navigationController?.pushViewController(displayViewController, animated: true)
    }

    // Helper function to show empty input error
    func showEmptyError(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "The field \"\(fieldName)\" cannot be empty!", preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    // Helper function to show other errors
    func showError(content: String) {
        let alert = UIAlertController(title: "Error!", message: content, preferredStyle: .alert)
                
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    // Helper function to check whether email is valid
    // Reference: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
    func isValidEmail(_ email: String) -> Bool {
        let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", EMAIL_REGEX)
        return emailPred.evaluate(with: email)
    }
    
    // Helper function to check whether phone number is valid
    // Reference: https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // valid formats: 123-456-7890 and 1234567890
        let PHONE_REGEX = "^\\d{3}-?\\d{3}-?\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: phoneNumber)
        return result
   }
    
    // Helper function to check whether city and State is valid
    // Reference: Piazza https://northeastern.instructure.com/courses/192495/external_tools/289
    func isValidCityAndState(_ cityAndState: String) -> Bool {
        // Regular expression for validating "City, State" format
        let CITY_STATE_REGEX = "^[A-Za-z]+(?:[\\s-][A-Za-z]+)*,\\s[A-Za-z]+(?:[\\s-][A-Za-z]+)*$"
        
        // NSPredicate to evaluate the string against the regex
        let cityStateTest = NSPredicate(format: "SELF MATCHES %@", CITY_STATE_REGEX)
        
        // Return true if the input matches the regex, otherwise false
        return cityStateTest.evaluate(with: cityAndState)
    }
    
    //Helper function to check whether phone number is valid
    func isValidZip(_ zip: String) -> Bool {
        // ZIP code should 5 digits long and is a valid integer.
        if let zipCode = Int(zip), zip.count == 5, zipCode <= 99950 {
            return true
        }
        return false
    }
}

//MARK: implementing phoneType PickerView...
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in phoneTypePicker: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ phoneTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneType.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ phoneTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedType = phoneType[row]
        return phoneType[row]
    }
}
