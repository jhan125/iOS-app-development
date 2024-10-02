//
//  ViewController.swift
//  App1
//
//  Created by Jiali Han on 9/16/24.
//

import UIKit

class ViewController: UIViewController {

    // @IBOutlet means it's an outlet from the Interface Builder (storyboard)
    // textFieldUser is the logical instance of the TextField from storyboard in the ViewController class.
    @IBOutlet var buttonClickMe: UIButton!
    @IBOutlet var textFieldUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonClickMe.addTarget(self, action:#selector(onButtonClickMeTapped), for: .touchUpInside)
    }
    @objc func onButtonClickMeTapped(){
        //print("Button Clicked!!")
        // MARK: fetching the text the user typed...
        let text = textFieldUser.text
        
        if let unwrappedText = text{
            if(unwrappedText.isEmpty){ //The user didn't put anything...
                showErrorAlert()
            } else{ //The user put some texts...
                showAlertText(text: unwrappedText)
            }
        }
    }
    //MARK: Error alert...
    func showErrorAlert(){
        let alert = UIAlertController(
            title: "Error!", message: "Text Field must not be empty!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

    //MARK: text alert...
    func showAlertText(text:String){
        let alert = UIAlertController(
            title: "You said:",
            message: "\(text)",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}

