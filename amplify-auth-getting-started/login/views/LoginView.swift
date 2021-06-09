//
//  LoginView.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-06.
//

import UIKit

class LoginView: UIView {
    
    lazy var spacing: CGFloat = 8
    lazy var stackSpacer: CGFloat = spacing * 6
    lazy var headerStackSpacing: CGFloat = spacing * 4
    lazy var credentialStackSpacing: CGFloat = spacing * 4
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var usernameTextField: TextField = {
        let textField = TextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.textContentType = .name // default
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var emailTextField: TextField = {
        let textField = TextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.textContentType = .emailAddress // default
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var passwordTextField: TextField = {
        let textField = TextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.textContentType = .password // default
        textField.textField.isSecureTextEntry = true
        textField.backgroundColor = .clear
        return textField
    }()
    
    lazy var headerStackView: UIStackView = {
        let subviews:[UIView] = [titleLabel, messageLabel]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = headerStackSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    lazy var credentialStackView: UIStackView = {
        let subviews:[UIView] = [usernameTextField, emailTextField, passwordTextField]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = credentialStackSpacing
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()

    /// sign up or sign in
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 32, bottom: 8, right: 32)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(superview: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(superview: UIView) {
        superview.addSubview(headerStackView)
        superview.addSubview(credentialStackView)
        superview.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: superview.topAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: credentialStackView.topAnchor, constant: -stackSpacer),
            headerStackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            credentialStackView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: stackSpacer),
            credentialStackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -stackSpacer),
            credentialStackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: spacing * 4),
            credentialStackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: credentialStackView.bottomAnchor, constant: stackSpacer),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            loginButton.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
        ])
        
    }
}


