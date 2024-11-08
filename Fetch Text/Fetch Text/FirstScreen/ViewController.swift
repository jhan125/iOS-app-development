//
//  ViewController.swift
//  Fetch Text
//
//  Created by Jiali Han on 10/18/24.
//

import UIKit

class ViewController: UIViewController {

    let firstScreen = FirstScreenView()
    //MARK: instantiating the Notification center...
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First Screen"
        
        //MARK: buttonSend target...
        firstScreen.buttonFetch
            .addTarget(self, action: #selector(onButtonFetchTapped), for: .touchUpInside)
        
        //MARK: observing text if it is updated in NotificationCenter...
        // add a selector method to handle the data we get back as part of the notification.
        // just observing a notification of the name: "textFromSecondScreen."
        // object parameter is nil, means the first screen will not send any object; it will just listen.
        notificationCenter.addObserver(
            self, selector: #selector(notificationReceivedForTextChanged(notification:)),
            name: .textFromScondScreen,
            object: nil)
        
        //notificationCenter.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)

    }
    
    @objc func notificationReceivedForTextChanged(notification: Notification){
            firstScreen.labelReceivedText.text = (notification.object as! String)
    }
    
    @objc func onButtonFetchTapped(){
        let secondScrren = SecondScreenViewController()
        navigationController?.pushViewController(secondScrren, animated: true)
    }


}

