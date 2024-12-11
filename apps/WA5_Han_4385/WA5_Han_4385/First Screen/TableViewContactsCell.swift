//
//  TableViewContactsCell.swift
//  WA5_Han_4385
//
//  Created by Jiali Han on 10/11/24.
//

import UIKit

class TableViewContactsCell: UITableViewCell {

    var wrapperCellView: UIView!
       
       var imagePhoto: UIImageView!;
       var labelNameTitle: UILabel!
       var labelEmail: UILabel!
       var labelPhone: UILabel!
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           setImagePhoto()
           setupWrapperCellView()
           setupLabelNameTitle()
           setupLabelEmail()
           setupLabelPhone()
           initConstraints()
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
       
       func setupWrapperCellView(){
           wrapperCellView = UITableViewCell()
           wrapperCellView.layer.borderColor = UIColor.gray.cgColor
           wrapperCellView.layer.borderWidth = 1
           wrapperCellView.layer.cornerRadius = 10
           wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
           self.addSubview(wrapperCellView)
       }
       
       func setupLabelNameTitle(){
           labelNameTitle = UILabel()
           labelNameTitle.font = UIFont.boldSystemFont(ofSize: 16)
           labelNameTitle.translatesAutoresizingMaskIntoConstraints = false
           wrapperCellView.addSubview(labelNameTitle)
       }
       func setupLabelEmail(){
           labelEmail = UILabel()
           labelEmail.font = UIFont.systemFont(ofSize: 14)
           labelEmail.translatesAutoresizingMaskIntoConstraints = false
           wrapperCellView.addSubview(labelEmail)
       }
       func setupLabelPhone(){
           labelPhone = UILabel()
           labelPhone.font = UIFont.systemFont(ofSize: 14)
           labelPhone.translatesAutoresizingMaskIntoConstraints = false
           wrapperCellView.addSubview(labelPhone)
       }
       
       func initConstraints(){
           NSLayoutConstraint.activate([
               wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
               wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
               wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
               
               imagePhoto.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
               imagePhoto.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
               imagePhoto.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
               imagePhoto.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8),
               imagePhoto.widthAnchor.constraint(equalToConstant: 80),
               imagePhoto.heightAnchor.constraint(equalToConstant: 80),
               
               labelNameTitle.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 12),
               labelNameTitle.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 10),
               labelNameTitle.heightAnchor.constraint(equalToConstant: 24),
               
               labelEmail.topAnchor.constraint(equalTo: labelNameTitle.bottomAnchor, constant: 4),
               labelEmail.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 10),
               labelEmail.heightAnchor.constraint(equalToConstant: 18),
               
               labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
               labelPhone.leadingAnchor.constraint(equalTo: imagePhoto.trailingAnchor, constant: 10),
               labelPhone.heightAnchor.constraint(equalToConstant: 18),
               
               wrapperCellView.heightAnchor.constraint(equalToConstant: 96),
               self.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: 8)
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
