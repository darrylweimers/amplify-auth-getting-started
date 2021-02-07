//
//  LoginView.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-06.
//

import UIKit

class LoginView: UIView {
    
    lazy var spacing: CGFloat = 8
    lazy var spaceBetweenTextFieldAndButton: CGFloat = spacing * 6
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
        return textField
    }()
    
    lazy var emailTextField: TextField = {
        let textField = TextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.textContentType = .emailAddress // default
        return textField
    }()
    
    lazy var passwordTextField: TextField = {
        let textField = TextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textField.textContentType = .password // default
        textField.textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var headerStackView: UIStackView = {
        let subviews:[UIView] = [titleLabel, messageLabel]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
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
        return stackView
    }()
    
    lazy var rootStackView: UIStackView = {
        let subviews:[UIView] = [headerStackView, credentialStackView]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16 * 2
        stackView.distribution = .fillEqually
        stackView.alignment = .center
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
        superview.addSubview(rootStackView)
        superview.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: superview.topAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -spaceBetweenTextFieldAndButton),
            rootStackView.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: spaceBetweenTextFieldAndButton),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            loginButton.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
        ])
        
    }
    
    

    
}


