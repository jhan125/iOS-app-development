//
//  CreateNoteViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit
import Alamofire

class CreateNoteViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let createNotePage = CreateNoteView()
    
    override func loadView() {
        view = createNotePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Note"
        
        createNotePage.buttonSave.addTarget(self, 
                                            action: #selector(onButtonSaveTapped),
                                            for: .touchUpInside)
    }
    
    @objc func onButtonSaveTapped() {
        postNote(token: getToken()!, text: createNotePage.textNoteInput.text!)
    }
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }

}
