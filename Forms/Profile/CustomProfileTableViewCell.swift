//
//  JobCellViewTableViewCell.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import UIKit

class CustomProfileTableViewCell : UITableViewCell {

    static var identifier = "CustomProfileTableViewCell"
    
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
    open var valueView: UIView = {
        let valueView = UIView()
        valueView.translatesAutoresizingMaskIntoConstraints = false
        valueView.backgroundColor = .systemBackground
        return valueView
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
    
    override func prepareForReuse() {
        for views in valueView.subviews{
            views.removeFromSuperview()
        }
    }
    private func configureCellView(){
        self.selectionStyle = .none
        self.backgroundColor = .systemBackground
        self.contentView.addSubview(itemName)
        self.contentView.addSubview(valueView)
        self.contentView.addSubview(separator)
    }
    private func configureCellConstraints(){
        
        NSLayoutConstraint.activate([
        
            itemName.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemName.widthAnchor.constraint(equalToConstant: 100),
            itemName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                        
            valueView.leadingAnchor.constraint(equalTo: itemName.trailingAnchor),
            valueView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            valueView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            separator.leadingAnchor.constraint(equalTo: valueView.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo:self.trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant:1),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
        
    }
    
    func configureCell(_ itemName : String){
        self.itemName.text = itemName
    }
}
