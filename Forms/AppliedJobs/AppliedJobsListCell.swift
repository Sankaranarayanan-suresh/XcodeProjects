//
//  JobInfoCellTableViewCell.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class AppliedJobListCell: UITableViewCell {
    
    static var identifier = "AppliedJobListCell"
    
    lazy var jobImage: UIImageView = {
        let jobImage = UIImageView()
        jobImage.layer.cornerRadius = 26
        jobImage.clipsToBounds = true
        jobImage.contentMode = .scaleAspectFit
        jobImage.translatesAutoresizingMaskIntoConstraints = false
        jobImage.tintColor = .systemPink.withAlphaComponent(0.4)
        return jobImage
    }()

    lazy var jobTitle: UILabel = {
        let jobTitle = UILabel()
        jobTitle.textColor = .label
        jobTitle.textAlignment = .natural
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        return jobTitle
    }()
    lazy var profileEmail: UILabel = {
        let profileEmail = UILabel()
        profileEmail.textColor = .secondaryLabel
        profileEmail.font = .systemFont(ofSize: 14)
        profileEmail.textAlignment = .natural
        profileEmail.translatesAutoresizingMaskIntoConstraints = false
        return profileEmail
    }()
    lazy var companyName: UILabel = {
        let companyName = UILabel()
        companyName.textColor = .secondaryLabel
        companyName.font = .systemFont(ofSize: 10)
        companyName.textAlignment = .natural
        companyName.translatesAutoresizingMaskIntoConstraints = false
        return companyName
    }()
    lazy var location: UILabel = {
        let location = UILabel()
        location.textColor = .tertiaryLabel
        location.font = .systemFont(ofSize: 10)
        location.textAlignment = .natural
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
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
        self.accessoryType = .disclosureIndicator
        self.contentView.addSubview(jobImage)
        self.contentView.addSubview(jobTitle)
        self.contentView.addSubview(profileEmail)
        self.contentView.addSubview(companyName)
        self.contentView.addSubview(location)
    }
    
    private func configureCellConstraints() {
        NSLayoutConstraint.activate([
            jobImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            jobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            jobImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            jobImage.widthAnchor.constraint(equalTo: contentView.heightAnchor,multiplier: 0.8),
            
            jobTitle.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            jobTitle.topAnchor.constraint(equalTo: jobImage.topAnchor),
           
            profileEmail.topAnchor.constraint(equalTo: jobTitle.bottomAnchor),
            profileEmail.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            profileEmail.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -2),
//            jobDescription.widthAnchor.constraint(equalTo:)
            
            companyName.topAnchor.constraint(equalTo: profileEmail.bottomAnchor),
            companyName.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            
            location.topAnchor.constraint(equalTo: profileEmail.bottomAnchor),
            location.leadingAnchor.constraint(equalTo: companyName.trailingAnchor, constant: 4),
        ])
    }
    
    func configureCell(_ jobObj : AppliedJob){
        self.jobTitle.text = jobObj.job.jobName
        self.profileEmail.text = jobObj.profile.email
        self.companyName.text = jobObj.job.companyName
        self.location.text = "(\(jobObj.job.location))"
        if let image = jobObj.profile.profilePhoto {
            jobImage.image = image
        }else {
            jobImage.image = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
        }
    }
}

