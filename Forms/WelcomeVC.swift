//
//  ViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 03/05/23.
//

import UIKit
let content = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."


class WelcomeVC: UIViewController {
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headingView, bodyContent])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 15
        stack.setCustomSpacing(50, after: headingView)
        stack.setCustomSpacing(20, after: bodyContent)
        return stack
    }()
    
    lazy var headingView: UILabel = {
        let heading = UILabel()
        heading.font = .systemFont(ofSize: 24, weight: .bold)
        heading.text = "Zoho Projects is hiring!!!"
        //        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.textAlignment = .left
        heading.textColor = .label
        heading.backgroundColor = .clear
        heading.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return heading
    }()
    lazy var bodyContent : UITextView = {
        let bodyContent = UITextView()
        bodyContent.font = .systemFont(ofSize: 17)
        bodyContent.text = content
        bodyContent.isEditable = false
        bodyContent.textColor = .label
        bodyContent.textAlignment = .justified
        bodyContent.setContentHuggingPriority(.defaultLow, for: .vertical)
        return bodyContent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        view.addSubview(stackView)
        configureLayouts()
        
    }
    private func configureLayouts(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            
            headingView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
            bodyContent.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
        ])
        
    }
}
