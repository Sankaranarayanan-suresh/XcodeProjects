//
//  JobCellViewTableViewCell.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import UIKit

class JobDetailsTableViewCell: UITableViewCell {

    static var identifier = "JobDetailsTableViewCell"
    
    lazy var itemName: CustomFormlabel = {
        let itemName = CustomFormlabel()
        itemName.textColor = .secondaryLabel
        itemName.font = .systemFont(ofSize: 12)
        itemName.backgroundColor = .systemGray6
        itemName.numberOfLines = 0
        itemName.textAlignment = .right
        itemName.translatesAutoresizingMaskIntoConstraints = false
        return itemName
    }()
    lazy var itemContent: UILabel = {
        let itemContent = UILabel()
        itemContent.textColor = .label
        itemContent.font = .systemFont(ofSize: 14)
        itemContent.numberOfLines = 0
        itemContent.textAlignment = .justified
        itemContent.translatesAutoresizingMaskIntoConstraints = false
        return itemContent
    }()
    
    lazy var separator: UIView = {
        let separatorView = UIView(frame: CGRect(x: self.separatorInset.right , y: 0, width: 20, height: 1))
        separatorView.backgroundColor = .systemGray6
        separatorView.translatesAutoresizingMaskIntoConstraints  = false

        return separatorView
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
        self.contentView.addSubview(itemName)
        self.contentView.addSubview(itemContent)
        self.contentView.addSubview(separator)
    }
    private func configureCellConstraints(){
        
        NSLayoutConstraint.activate([
        
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemName.widthAnchor.constraint(equalToConstant: 100),
            itemName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                        
            itemContent.leadingAnchor.constraint(equalTo: itemName.trailingAnchor,constant: 7),
            itemContent.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            itemContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo:contentView.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant:1),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    func configureCell(_ itemName : String, _ itemContent : String){
        self.itemName.text = itemName
        self.itemContent.text = itemContent
    }
}
