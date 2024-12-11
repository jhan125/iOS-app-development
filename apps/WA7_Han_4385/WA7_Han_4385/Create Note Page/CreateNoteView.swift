//
//  CreateNoteView.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class CreateNoteView: UIView {

    var textNoteInput: UITextView!
    var buttonSave: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setTextNoteInput()
        setButtonSave()
        
        initConstraints()
    }
    
    func setTextNoteInput() {
        textNoteInput = UITextView()
        textNoteInput.font = .systemFont(ofSize: 18)
        textNoteInput.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textNoteInput)
    }
    
    func setButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.titleLabel?.font = .boldSystemFont(ofSize: 20)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.configuration = .filled()
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            textNoteInput.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            textNoteInput.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textNoteInput.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textNoteInput.bottomAnchor.constraint(equalTo: buttonSave.topAnchor, constant: -16),
            
            buttonSave.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant:  -30),
            buttonSave.widthAnchor.constraint(equalToConstant: 120),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        ])
    }
    
    //MARK: initializing constraints...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
