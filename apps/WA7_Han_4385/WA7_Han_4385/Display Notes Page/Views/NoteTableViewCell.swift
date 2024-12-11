//
//  NoteTableViewCell.swift
//  WA7_Han_4385
//
//  Created by Jiali Han on 10/29/24.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelNotePreview:UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setLabelNotePreview()
        
        initConstraints()
    }

    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setLabelNotePreview(){
        labelNotePreview = UILabel()
        
        labelNotePreview.font = UIFont.systemFont(ofSize: 16)
        labelNotePreview.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelNotePreview)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            labelNotePreview.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            labelNotePreview.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 30),
            labelNotePreview.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -50),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 36),
        ])
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

