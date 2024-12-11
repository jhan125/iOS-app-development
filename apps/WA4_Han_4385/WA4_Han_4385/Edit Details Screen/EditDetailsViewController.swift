//
//  EditDetailsViewController.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/10/24.
//

import UIKit
import PhotosUI // importing the library to use PHPicker...

class EditDetailsViewController: UIViewController {
    
    var receivedContact: Contact!

    var delegate: DisplayDetailsViewController!
    
    var selectedType = "Home"
    
    var pickedImage:UIImage? = UIImage(systemName:"person.fill")
    
    let addContactScreen = AddContactView()
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Contact"
        
        setupData()
        
        addContactScreen.buttonSelectPhoneType.menu = getMenuTypes();
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        
        addContactScreen.buttonSave.addTarget(self,
                                              action: #selector(onButtonSaveTapped),
                                              for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: menu for buttonTakePhoto setup...
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        //MARK: Photo from Gallery...
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in PhoneType.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                self.selectedType = type
                self.addContactScreen.buttonSelectPhoneType.setTitle(self.selectedType, for: .normal)
            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func setupData() {
        //        addContactScreen.textFieldName.text = receivedContact.name!;
        //        addContactScreen.textFieldEmail.text! = receivedContact.email!;
        //        addContactScreen.textFieldPhoneNumber.text! = receivedContact.phoneNumber!;
        //        addContactScreen.textFieldAddress.text! = receivedContact.address!
        //        addContactScreen.textFieldCityAndState.text! = receivedContact.cityAndState!
        //        addContactScreen.textFieldZip.text! = receivedContact.zip!
        //
        //        addContactScreen.buttonTakePhoto.setImage(receivedContact.pickedImage!, for: .normal)
        //        print()
        //
        //        addContactScreen.buttonSelectPhoneType.setTitle(receivedContact.phoneType!, for: .normal)
        //
        //        selectedType = receivedContact.phoneType!
        //        pickedImage = receivedContact.pickedImage!
        addContactScreen.textFieldName.text = receivedContact.name ?? ""
        addContactScreen.textFieldEmail.text = receivedContact.email ?? ""
        addContactScreen.textFieldPhoneNumber.text = receivedContact.phoneNumber ?? ""
        addContactScreen.textFieldAddress.text = receivedContact.address ?? ""
        addContactScreen.textFieldCityAndState.text = receivedContact.cityAndState ?? ""
        addContactScreen.textFieldZip.text = receivedContact.zip ?? ""
        
        // Safely unwrap the image and set a default if needed
        if let image = receivedContact.pickedImage {
            print("Setting pickedImage: \(image)")
            addContactScreen.buttonTakePhoto.setImage(image, for: .normal)
            print("Image set on button: \(String(describing: receivedContact.pickedImage))")
        } else {
            print("No image found, setting default")
            addContactScreen.buttonTakePhoto.setImage(UIImage(systemName: "person.circle"), for: .normal)
        }
        
        // Set the phone type and selected image safely
        addContactScreen.buttonSelectPhoneType.setTitle(receivedContact.phoneType ?? "Home", for: .normal)
        selectedType = receivedContact.phoneType ?? "Home"
        pickedImage = receivedContact.pickedImage ?? UIImage(systemName: "person.circle")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addContactScreen.buttonTakePhoto.setImage(pickedImage, for: .normal)
    }

    
    @objc func onButtonSaveTapped() {
        // Safely unwrapping text fields using guard
        // Reference: https://stackoverflow.com/questions/63667226/force-unwrap-after-guard-let
        guard let name = addContactScreen.textFieldName?.text, !name.isEmpty else {
           return showEmptyError(fieldName: "Name")
        }
           
        guard let email = addContactScreen.textFieldEmail?.text, !email.isEmpty else {
            return showEmptyError(fieldName: "Email")
        }
           
        guard isValidEmail(email) else {
            return showError(content: "Email address is invalid!")
        }
           
        guard let phoneNumber = addContactScreen.textFieldPhoneNumber.text, !phoneNumber.isEmpty else {
            return showEmptyError(fieldName: "PhoneNumber")
        }
        
        // phone number follows 10-digit dialing procedure
        // Reference: https://en.wikipedia.org/wiki/Ten-digit_dialing
        guard isValidPhoneNumber(phoneNumber) else {
            return showError(content: "Phone number is invalid!")
        }
           
        guard let address = addContactScreen.textFieldAddress.text, !address.isEmpty else {
            return showEmptyError(fieldName: "Address")
        }
           
        guard let cityAndState = addContactScreen.textFieldCityAndState.text, !cityAndState.isEmpty else {
            return showEmptyError(fieldName: "City, State")
        }
        
        guard isValidCityAndState(cityAndState) else {
            return showError(content: "City and State is invalid!")
        }
           
        guard let zip = addContactScreen.textFieldZip.text, !zip.isEmpty else {
            return showEmptyError(fieldName: "Zip")
        }
        
        // validate if the user put a valid zipcode (exactly five digits long, the current Zip codes in the United States range from 00001 – 99950).
        guard isValidZip(zip) else {
            return showError(content: "Zip number is invalid!")
        }
        
        // debug
        print("Name: \(name)")
        print("Email: \(email)")
        print("PhoneNumber: \(phoneNumber)")
        print("Address: \(address)")
        print("CityAndState: \(cityAndState)")
        print("Zip: \(zip)")
        print("Selected Type: \(selectedType)")
        print("Picked Image: \(String(describing: pickedImage))")
        print("Delegate: \(String(describing: delegate))")

            
        // Creating the package once all validation checks are passed
        let contact = Contact(
            name: name,
            email: email,
            phoneType: selectedType,
            phoneNumber: phoneNumber,
            address: address,
            cityAndState: cityAndState,
            zip: zip,
            pickedImage: pickedImage ?? UIImage(systemName: "person.circle") // Provide default image if nil
        )
        
        // Call the delegate method to update the contact
        delegate.delegateOnAddContact(contact: contact)
           
        // Once editing is done, return to the Display screen and then the main screen using the navigation controller.
        navigationController?.popViewController(animated: true) // back to display screen
        navigationController?.popViewController(animated: true) // back to main screen
    }
    
    func EmptyError(fieldName: String) {
        let alert = UIAlertController(title: "Error!", message: "The \(fieldName) cannot be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
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
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
}

//MARK: adopting required protocols for PHPicker...
extension EditDetailsViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker...
extension EditDetailsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // If a user forgets to take a photo, display a default system image, like an avatar, on that contact row.
            let defaultImage = UIImage(systemName: "person.circle")
            self.addContactScreen.buttonTakePhoto.setImage(
                defaultImage?.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = defaultImage
        }
    }
}
