//
//  NotePageViewController.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class DisplayNotesPageViewController: UIViewController {

    let defaults = UserDefaults.standard
    let notificationCenter = NotificationCenter.default
    let notesPage = DisplayNotesPageView()
    
    //MARK: list to display the notes in the TableView...
    var notesFolder = [Note]()
    
    override func loadView() {
        view = notesPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up the top bar
        navigationItem.hidesBackButton = true
        title = "My Notes"
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, 
            target: self,
            action: #selector(onAddBarButtonTapped)
        )
    
        notesPage.NotesTableView.dataSource = self
        notesPage.NotesTableView.delegate = self

        // get all notes
        updateAllCells()
        
        notesPage.buttonProfile.addTarget(self,
                                          action: #selector(onButtonProfileTapped),
                                          for: .touchUpInside)
        
        notesPage.buttonLogout.addTarget(self,
                                         action: #selector(onButtonLogoutTapped),
                                         for: .touchUpInside)
    }
    
    // push out create note page
    @objc func onAddBarButtonTapped() {
        notificationCenter.addObserver(
            self,
            selector: #selector(NotificationAddCells(notification:)),
            name:.posted,
            object: nil)
        
        let createNotePage = CreateNoteViewController()
        navigationController?.pushViewController(createNotePage, animated: true)
    }
    
    // push out profile page
    @objc func onButtonProfileTapped() {
        let profilePage = ProfileViewController()
        navigationController?.pushViewController(profilePage, animated: true)
    }
    
    // update values in notesFolder, refreash the table view
    @objc func updateAllCells () {
        if let token = getToken() {
            notificationCenter.addObserver(
                self,
                selector: #selector(setNotes(notification:)),
                name:.notesReceived,
                object: nil)
            
            getAllNotes(token: token)
        }
    }
    
    // MARK: Notification call for updateAllCells,
    func initializeFolder () {
        notesFolder.removeAll()
    }
    
    // MARK: Notification call for updateAllCells
    @objc func NotificationAddCells (notification: Notification) {
        updateAllCells()
    }
    
    @objc func NotificationDeleteCells (notification: Notification) {
        updateAllCells()
    }
    
    // MARK: click registerButton - reset the token then back to the login page
    @objc func onButtonLogoutTapped() {
        if let token = getToken() {
            logout(token: token)
        }
        
        defaults.removeObject(forKey: "AuthToken")
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: When updateAllCells get all data, this function sets values in notesFolder, then refresh
    @objc func setNotes(notification: Notification) {
        initializeFolder()
        if let notes = notification.object as! Notes? {
            for note in notes.notes {
                notesFolder.append(note)
            }
            notesPage.NotesTableView.reloadData()
        }
    }
    
    @objc func getToken() -> String? {
        return defaults.object(forKey: "AuthToken") as! String?
    }
}

extension DisplayNotesPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, 
                   numberOfRowsInSection section: Int) -> Int {
        return notesFolder.count
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", 
                                                 for: indexPath) as! NoteTableViewCell
        cell.labelNotePreview.text = notesFolder[indexPath.row].text
        
        //MARK: crating an accessory button...
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        
        //MARK: setting an icon from sf symbols...
        buttonOptions.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        
        //MARK: setting up menu for button options click...
        buttonOptions.menu = UIMenu(title: "Choose your Action: ",
                                    children: [
                                        UIAction(title: "View", handler: { _ in
                                            // navigate to view note page
                                            let viewNotePage = EditNoteViewController()
                                            viewNotePage.initData(note: self.notesFolder[indexPath.row], mode: .view)
                                            self.navigationController?.pushViewController(viewNotePage, animated: true)
                                        }),
                                        UIAction(title: "Edit", handler: { _ in
                                            // navigate to edit note page
                                            self.notificationCenter.addObserver(
                                                self,
                                                selector: #selector(self.NotificationAddCells(notification:)),
                                                name: .posted,
                                                object: nil)
                                            
                                            let editNotePage = EditNoteViewController()
                                            editNotePage.initData(note: self.notesFolder[indexPath.row], mode: .edit)
                                            self.navigationController?.pushViewController(editNotePage, animated: true)
                                        }),
                                        UIAction(title: "Delete",handler: {(_) in
                                            
                                            if let token = self.getToken() {
                                                self.notificationCenter.addObserver(
                                                    self,
                                                    selector: #selector(self.NotificationDeleteCells(notification:)),
                                                    name:.deleted,
                                                    object: nil)
                                                
                                                self.deleteNote(token: token, note: self.notesFolder[indexPath.row])
                                                
                                            }
                                        })
                                    ])
        //MARK: setting the button as an accessory of the cell...
        cell.accessoryView = buttonOptions
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", 
                                                 for: indexPath) as! NoteTableViewCell
        
        if let noteText = cell.labelNotePreview.text {
            print("User touched note: \(noteText)")
        } else {
            print("User touched an empty note.")
        }
    }
}
