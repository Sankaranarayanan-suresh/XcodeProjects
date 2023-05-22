//
//  JobInfoCellTableViewCell.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class ViewProfileCell: UITableViewCell {
    
    static var identifier = "ViewProfileCell"
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.layer.cornerRadius = 40
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.tintColor = .systemPink.withAlphaComponent(0.4)
        return profileImage
    }()

    lazy var firstName: UILabel = {
        let firstName = UILabel()
        firstName.textColor = .label
        firstName.textAlignment = .natural
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
    }()
    lazy var profileEmail: UILabel = {
        let profileEmail = UILabel()
        profileEmail.textColor = .label
        profileEmail.font = .systemFont(ofSize: 14)
        profileEmail.textAlignment = .natural
        profileEmail.translatesAutoresizingMaskIntoConstraints = false
        return profileEmail
    }()
    lazy var lastName: UILabel = {
        let lastName = UILabel()
        lastName.textColor = .label
        lastName.textAlignment = .natural
        lastName.translatesAutoresizingMaskIntoConstraints = false
        return lastName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellView()
        configureCellConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCellView(){
        self.contentView.addSubview(profileImage)
        self.contentView.addSubview(firstName)
        self.contentView.addSubview(profileEmail)
        self.contentView.addSubview(lastName)
    }
    
    private func configureCellConstraints() {
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            profileImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            profileImage.widthAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.8),
            
            firstName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            firstName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -10),
            firstName.heightAnchor.constraint(equalToConstant: 20),
            
            lastName.leadingAnchor.constraint(equalTo: firstName.trailingAnchor, constant: 4),
            lastName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: -10),
            lastName.heightAnchor.constraint(equalToConstant: 20),


           
            profileEmail.topAnchor.constraint(equalTo: firstName.bottomAnchor),
            profileEmail.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10),
            profileEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -2),
//            jobDescription.widthAnchor.constraint(equalTo:)
            
            
        ])
    }
    
    func configureCell(_ sectionData : [CustomFormCellObj]){
        if let image = sectionData[0].value as? UIImage {
            self.profileImage.image = image
        }else{
            self.profileImage.image = UIImage(systemName: "person.circle")
        }
        self.firstName.text = sectionData[1].value as? String
        self.lastName.text = sectionData[2].value as? String
        self.profileEmail.text = sectionData[3].value as? String
    }
}
