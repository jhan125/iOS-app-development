//
//  DisplayViewController.swift
//  WA3_Han_4385
//
//  Created by Jiali Han on 9/23/24.
//

import UIKit

class DisplayViewController: UIViewController {

    //MARK: creating instance of DisplayView...
    let displayScreen = DisplayView();
        
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = displayScreen
    }
    
    //MARK: information from the first screen...
    var receivedPackage: ViewController.Package = ViewController.Package()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting the Labels' texts...
        if let unwrappedName = receivedPackage.name{
            if !unwrappedName.isEmpty{
                displayScreen.labelName.text = "Name: \(unwrappedName)"
            }
        }
        
        if let unwrappedEmail = receivedPackage.email{
            if !unwrappedEmail.isEmpty{
                displayScreen.labelEmail.text = "Email: \(unwrappedEmail)"
            }
        }
        
        let unwrappedPhoneType = receivedPackage.phoneType!
        let unwrappedPhoneNumber = receivedPackage.phoneNumber!
        
        if !unwrappedPhoneNumber.isEmpty{
            displayScreen.labelPhone.text = "Phone: \(unwrappedPhoneNumber) (\(unwrappedPhoneType))"
        }
        
        if let unwrappedAddress = receivedPackage.address{
            if !unwrappedAddress.isEmpty{
                displayScreen.labelAddress.text = "Address: \(unwrappedAddress)"
            }
        }
        
        if let unwrappedCityAndState = receivedPackage.cityAndState{
            if !unwrappedCityAndState.isEmpty{
                displayScreen.labelCityAndState.text = "\(unwrappedCityAndState)"
            }
        }
        
        if let unwrappedZip = receivedPackage.zip{
            if !unwrappedZip.isEmpty{
                displayScreen.labelZip.text = "ZIP: \(unwrappedZip)"
            }
        }
        
        displayScreen.imagePhone.image = UIImage(named: unwrappedPhoneType.lowercased())
    }
}
