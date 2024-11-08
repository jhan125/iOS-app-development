//
//  SecondScreenViewController.swift
//  Fetch Text
//
//  Created by Jiali Han on 10/18/24.
//

import UIKit

class SecondScreenViewController: UIViewController {

    let secondScreen = SecondScreenView()
    
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
        
        
    override func loadView() {
        view = secondScreen
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second Screen"
        
        secondScreen.buttonSendBack
            .addTarget(self, action: #selector(onButtonSendBackTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonSendBackTapped(){
        //  to send data from the parent screen to a child screen while creating the child screen, you should use the old way of sending data; usually Notification Center can't deliver the data.
        if let text = secondScreen.textFieldSendBack.text{
            //MARK: posting text to NotificationCenter...
            notificationCenter.post(
                name: .textFromScondScreen,
                object: text)
        }else{
            //Alert invalid input...
        }
        
    }
}
