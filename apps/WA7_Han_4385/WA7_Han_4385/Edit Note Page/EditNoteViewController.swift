//
//  EditNoteViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class EditNoteViewController: UIViewController {

    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let createNotePage = CreateNoteView()
    var myNote: Note?
    
    // mode property to distinguish between view and edit modes
    enum Mode {
        case view
        case edit
    }
    
    var mode: Mode = .edit
    
    override func loadView() {
        view = createNotePage
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set title based on mode
        title = (mode == .edit) 
                    ? "Edit Note"
                    : "View Note"
        
        // adjust UI based on mode
        if mode == .view {
            createNotePage.textNoteInput.isEditable = false
            createNotePage.buttonSave.isHidden = true
        } else {
            createNotePage.buttonSave.addTarget(self, action: #selector(onButtonSaveTapped), for: .touchUpInside)
        }
    }
    
    func initData(note: Note, mode: Mode = .edit) {
        self.mode = mode
        createNotePage.textNoteInput.text = note.text
        myNote = note
    }
    
    @objc func onButtonSaveTapped() {
        if var unwapNote = myNote {
            unwapNote.text = createNotePage.textNoteInput.text
            edit(token: getToken()!, note:unwapNote)
        }
    }
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }
}
