//
//  AddExpenseViewController.swift
//  Expense App
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

import PhotosUI //MARK: importing the library to use PHPicker...

class AddExpenseViewController: UIViewController {
    
    //MARK: initializing the ADDExpenseView...
    let addExpenseScreen = AddExpenseView()
    
    //MARK: by default Groceries is selected...
    var selectedType = "Groceries"
    
    //MARK: delegate to ViewController when getting back...
    var delegate:ViewController!
    
    //MARK: variable to store the picked Image...
    var pickedImage:UIImage?
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addExpenseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: patching delegate and datasource of the type PickerView...
        //        addExpenseScreen.pickerType.dataSource = self
        //        addExpenseScreen.pickerType.delegate = self
        
        //MARK: adding the action for tapping on buttonAdd...
        addExpenseScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
        //MARK: adding menu to buttonSelectType...
        addExpenseScreen.buttonSelectType.menu = getMenuTypes()
        //MARK: adding menu to buttonTakePhoto...
        addExpenseScreen.buttonTakePhoto.menu = getMenuImagePicker()
    }
    
    //MARK: menu for buttonSelectType setup...
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                self.selectedType = type
                self.addExpenseScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
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
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var title:String = ""
        if let titleText = addExpenseScreen.textFieldTitle.text{
            if !titleText.isEmpty{
                title = titleText
            }else{
                //do your thing to alert user...
                return
            }
        }
        
        var amount = 0.0
        if let amountText = addExpenseScreen.textFieldAmount.text{
            if !amountText.isEmpty{
                if let uwAmount = Double(amountText){
                    amount = uwAmount
                }else{
                    //alert the user that it's not a valid input...
                    return
                }
                
                
            }else{
                //do your thing to alert the user...
                return
            }
            
        }
        
        let newExpense = Expense(
            title: title,
            amount: amount,
            type: selectedType,
            image: pickedImage ?? (UIImage(systemName: "photo"))!
        )
        delegate.delegateOnAddExpense(expense: newExpense)
        navigationController?.popViewController(animated: true)
    }
}

//MARK: adopting the required protocols...
extension AddExpenseViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return Utilities.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = Utilities.types[row]
        return Utilities.types[row]
    }
}

//MARK: adopting required protocols for PHPicker...
extension AddExpenseViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addExpenseScreen.buttonTakePhoto.setImage(
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
extension AddExpenseViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addExpenseScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
