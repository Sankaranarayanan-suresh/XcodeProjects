//
//  TitleView.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class TitleView: UIView {

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: .init(systemName: "r.joystick.tilt.left.fill"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .systemRed.withAlphaComponent(0.8)
        return imageView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.preferredFont(forTextStyle: .largeTitle, compatibleWith: .none)
        ]
        label.attributedText = NSAttributedString(string: "Welcome", attributes: attributes)
        label.textColor = .label
        
        return label
    }()
    convenience init(){
        self.init(frame: .zero)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTitleView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureTitleView(){
        self.addSubview(imageView)
        self.addSubview(label)
    }
    private func configureConstraints(){
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 70),
            imageView.widthAnchor.constraint(equalTo: self.widthAnchor,constant: 25),
            
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
    }
    
    
    
}
