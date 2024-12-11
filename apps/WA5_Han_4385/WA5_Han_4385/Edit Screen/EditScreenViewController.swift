//
//  EditScreenViewController.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit
import PhotosUI

class EditScreenController: UIViewController {
    
    var receivedContacts: Contacts!

    var delegate: ContactDetailViewController!
    
    var selectedType = "Home"
    var pickedImage:UIImage? = UIImage(systemName:"person.fill")
    
    let addContactScreen = AddContactView()
    
    override func loadView() {
        view = addContactScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Contacts"
        
        setData()
        
        addContactScreen.buttonSelectType.menu = getMenuTypes();
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        
        addContactScreen.submitButton.addTarget(self,
                                                action: #selector(onSaveBarButtonTapped),
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
                                self.addContactScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func setData() {
        addContactScreen.nameField.text = receivedContacts.name!;
        addContactScreen.emailField.text! = receivedContacts.email!;
        addContactScreen.phoneNumberField.text! = receivedContacts.phoneNumber!;
        addContactScreen.addressField.text! = receivedContacts.address!
        addContactScreen.cityAndStateField.text! = receivedContacts.cityAndState!
        addContactScreen.zipField.text! = receivedContacts.zip!
        addContactScreen.buttonTakePhoto.setImage(receivedContacts.pickedImage!, for: .normal)
        
        addContactScreen.buttonSelectType.setTitle(receivedContacts.phoneType!, for: .normal)
        selectedType = receivedContacts.phoneType!
        pickedImage = receivedContacts.pickedImage!
    }
    
    
    @objc func onSaveBarButtonTapped() {
        let unwarppedName = addContactScreen.nameField.text!
        let unwarppedEmail = addContactScreen.emailField.text!
        let unwarppedPhoneNumber = addContactScreen.phoneNumberField.text!
        let unwarppedAddress = addContactScreen.addressField.text!
        let unwarppedCityAndState = addContactScreen.cityAndStateField.text!
        let unwarppedZip = addContactScreen.zipField.text!
        
        
        if unwarppedName.isEmpty {
            EmptyError(fieldName: "Name")
        }
        
        else if unwarppedEmail.isEmpty {
            EmptyError(fieldName: "Email")
        } else if !isValidEmail(unwarppedEmail) {
            otherError(content: "Email Address is invalid")
        }
        
        else if unwarppedPhoneNumber.isEmpty {
            EmptyError(fieldName: "PhoneNumber")
        } else if !(unwarppedPhoneNumber.count == 10) {
            otherError(content: "Phone number is invalid")
        }
        
        else if unwarppedAddress.isEmpty {
            EmptyError(fieldName: "Address")
        }
        
        else if unwarppedCityAndState.isEmpty {
            EmptyError(fieldName: "City, State")
        }
        
        else if unwarppedZip.isEmpty {
            EmptyError(fieldName: "Zip")
        } else if !(Int(unwarppedZip) ?? 0 <= 99950) || !(unwarppedZip.count == 5) {
            otherError(content: "Zip number is invalid")
        }
        
        else {
            let Contact = Contacts(name: unwarppedName, email: unwarppedEmail, phoneType: selectedType, phoneNumber: unwarppedPhoneNumber, address: unwarppedAddress, cityAndState: unwarppedCityAndState, zip: unwarppedZip, pickedImage: pickedImage)
            
            
            delegate.delegateOnAddContact(Contact: Contact)
            navigationController?.popViewController(animated: true)
//            navigationController?.popViewController(animated: true)
        }
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

//MARK: adopting required protocols for PHPicker...
extension EditScreenController:PHPickerViewControllerDelegate{
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
extension EditScreenController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
