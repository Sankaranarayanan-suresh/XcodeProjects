//
//  JobInfoCellTableViewCell.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class JobInfoCellTableViewCell: UITableViewCell {
    
    static var identifier = "JobInfoCellTableViewCell"
    
    lazy var jobImage: UIImageView = {
        let jobImage = UIImageView(image: .init(named: "JobImage"))
        jobImage.contentMode = .scaleAspectFit
        jobImage.translatesAutoresizingMaskIntoConstraints = false
        jobImage.backgroundColor = .clear
        jobImage.tintColor = .systemPink.withAlphaComponent(0.4)
        return jobImage
    }()

    lazy var jobTitle: UILabel = {
        let jobTitle = UILabel()
        jobTitle.textColor = .label
        jobTitle.textAlignment = .natural
        jobTitle.translatesAutoresizingMaskIntoConstraints = false
        jobTitle.text = "Job Title"
        return jobTitle
    }()
    lazy var jobDescription: UILabel = {
        let jobDescription = UILabel()
        jobDescription.textColor = .secondaryLabel
        jobDescription.font = .systemFont(ofSize: 14)
        jobDescription.textAlignment = .natural
        jobDescription.translatesAutoresizingMaskIntoConstraints = false
        jobDescription.text = "Job Description"
        return jobDescription
    }()
    lazy var companyName: UILabel = {
        let companyName = UILabel()
        companyName.textColor = .secondaryLabel
        companyName.font = .systemFont(ofSize: 10)
        companyName.textAlignment = .natural
        companyName.translatesAutoresizingMaskIntoConstraints = false
        companyName.text = "Job Title"
        return companyName
    }()
    lazy var location: UILabel = {
        let location = UILabel()
        location.textColor = .tertiaryLabel
        location.font = .systemFont(ofSize: 10)
        location.textAlignment = .natural
        location.translatesAutoresizingMaskIntoConstraints = false
        location.text = "Job Title"
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
        self.contentView.addSubview(jobDescription)
        self.contentView.addSubview(companyName)
        self.contentView.addSubview(location)
    }
    
    private func configureCellConstraints() {
        NSLayoutConstraint.activate([
            jobImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            jobImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            jobImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            jobImage.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            
            jobTitle.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            jobTitle.topAnchor.constraint(equalTo: jobImage.topAnchor),
           
            jobDescription.topAnchor.constraint(equalTo: jobTitle.bottomAnchor),
            jobDescription.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            jobDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -2),
//            jobDescription.widthAnchor.constraint(equalTo:)
            
            companyName.topAnchor.constraint(equalTo: jobDescription.bottomAnchor),
            companyName.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 10),
            
            location.topAnchor.constraint(equalTo: jobDescription.bottomAnchor),
            location.leadingAnchor.constraint(equalTo: companyName.trailingAnchor, constant: 4),
        ])
    }
    
    func configureCell(_ jobObj : job){
        self.jobTitle.text = jobObj.jobName
        self.jobDescription.text = jobObj.jobDescription
        self.companyName.text = jobObj.companyName
        self.location.text = "(\(jobObj.location))"
    }
    
}
