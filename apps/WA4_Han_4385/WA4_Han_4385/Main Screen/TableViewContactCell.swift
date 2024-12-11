//
//  TableViewContactCell.swift
//  WA4_Han_4385
//
//  Created by Jiali Han on 10/2/24.
//

import UIKit

class TableViewContactCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var imagePhoto: UIImageView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Disable cell selection style
        self.selectionStyle = .none
        
        setupWrapperCellView()
        setImagePhoto()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        self.addSubview(wrapperCellView)
    }
    
    func setImagePhoto() {
        imagePhoto = UIImageView()
        imagePhoto.image = UIImage(systemName: "photo")
        imagePhoto.contentMode = .scaleAspectFill
        imagePhoto.clipsToBounds = true
        imagePhoto.layer.cornerRadius = 10
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imagePhoto)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.font = UIFont.systemFont(ofSize: 18)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.font = UIFont.systemFont(ofSize: 18)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 2),
            labelName.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 32),
            labelName.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 2),
            labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelEmail.heightAnchor.constraint(equalToConstant: 32),
            labelEmail.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 2),
            labelPhone.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelPhone.heightAnchor.constraint(equalToConstant: 32),
            labelPhone.widthAnchor.constraint(lessThanOrEqualTo: labelName.widthAnchor),
            
            imagePhoto.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imagePhoto.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            //MARK: it is better to set the height and width of an ImageView with constraints...
            imagePhoto.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imagePhoto.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 104)
        ])
    }
    
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
