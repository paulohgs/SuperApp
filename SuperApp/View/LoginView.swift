//
//  File.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 17/08/22.
//

import UIKit

class LoginView: UIView {
    
    private lazy var getButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Digite email:"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 100, width: 300, height: 30.0))
        textField.borderStyle = .line
        textField.placeholder = "Email"
        textField.backgroundColor = .gray
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview()
        constraintTextLabel()
//        constraintsTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubview() {
        addSubview(textLabel)
//        addSubview(emailField)
    }
    
    private func constraintTextLabel() {
        let constraints = [
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ]
        
        constraints.forEach {(item) in
            item.isActive = true
        }
    }
    
    private func constraintsTextField() {
        let constraints = [
            emailField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20.0),
            emailField.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor)
        ]
        
        constraints.forEach {(item) in
            item.isActive = true
        }
    }
}
