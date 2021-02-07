//
//  ViewController.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-06.
//

import UIKit
import UtilityKit

class LoginController: UIViewController, UITextFieldDelegate {
    // MARK: - views
    lazy var loginView: LoginView = {
        let loginView = LoginView(frame: .zero)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    private lazy var agreementLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    public lazy var recoverySuggesionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.textColor = .red
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: init
    init(loginData: LoginData, loginForm: LoginFormType) {
        super.init(nibName: nil, bundle: nil)
        
        self.updateContent(with: loginData, and: loginForm)
        
        setupViews(superview: self.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        setupViews(superview: self.view)
        
        setupDelegates()
        
        /// dismiss keyboard
        dismissKeyboardWhenNotUse()
    }
    private var loginViewHeightConstraint: NSLayoutConstraint?
    
    private func updateLoginViewHeightConstraint() {
        // disable the height constraint
        loginViewHeightConstraint?.isActive = false
        
        // calculate height needed for the login view
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - spacing * 2
        let size = CGSize.getSizeWithFittingHeight(view: loginView, andRequiredWidth: width)
        
        // enable height
        loginViewHeightConstraint = loginView.heightAnchor.constraint(equalToConstant: size.height)
        loginViewHeightConstraint?.isActive = true
        
        //print(size)
        
        self.view.updateConstraintsIfNeeded()
    }
    
    private func setupViews(superview: UIView) {
        superview.addSubview(loginView)
        superview.addSubview(agreementLabel)
        superview.addSubview(recoverySuggesionLabel)
        let spacing: CGFloat = 8
        
        updateLoginViewHeightConstraint()
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: spacing), // TODO: prefer spacing: spacing * 16, but need to scroll up content when keyboard appears
            loginView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: spacing),
            loginView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -spacing),
        ])
        
        loginView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            recoverySuggesionLabel.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: spacing * 4),
            recoverySuggesionLabel.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: spacing * 2),
            recoverySuggesionLabel.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -spacing * 2),
        ])
        
        NSLayoutConstraint.activate([
            agreementLabel.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            agreementLabel.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            agreementLabel.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor)
        ])

    }
    
    private func setupDelegates() {
        loginView.usernameTextField.textField.delegate = self
        loginView.passwordTextField.textField.delegate = self
        loginView.emailTextField.textField.delegate = self
    }
    
    // MARK: - update content
    public func updateContent(with loginData: LoginData, and loginForm: LoginFormType) {
        // reset
        recoverySuggesionLabel.text = nil
        
        // update
        loginView.titleLabel.text = loginData.title
        loginView.messageLabel.text = loginData.message
        
        loginView.usernameTextField.textField.placeholder = loginData.usernamePlaceholder
        loginView.emailTextField.textField.placeholder = loginData.emailPlaceholder
        loginView.passwordTextField.textField.placeholder = loginData.passwordPlaceholder
        loginView.usernameTextField.iconImageView.image = loginData.usernameIcon
        loginView.emailTextField.iconImageView.image = loginData.emailIcon
        loginView.passwordTextField.iconImageView.image = loginData.passwordIcon
        
        loginView.loginButton.setTitle(loginData.loginButtonTitle, for: .normal)
        
        switch loginForm {
        
        case .signIn:
            loginView.emailTextField.isHidden = true
            
            agreementLabel.text = nil
            agreementLabel.isHidden = true
            break
            
        case .signUp:
            loginView.emailTextField.isHidden = false
            
            agreementLabel.text = loginData.termsAndConditions
            agreementLabel.isHidden = false
            break
            
        case .signUpConfirmation:
            loginView.passwordTextField.textField.text = nil
            
            loginView.emailTextField.isHidden = true
            
            agreementLabel.text = nil
            agreementLabel.isHidden = true
            break
        }
        
        updateLoginViewHeightConstraint()
    }

    // MARK: - text field delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


extension CGSize {

    public static func getSizeWithFittingHeight(view: UIView, andRequiredWidth width: CGFloat) -> CGSize {
        
        let fittingSize = CGSize(width: width,
                                 height: UIView.layoutFittingCompressedSize.height) // use the smallest possible value
        
        // returns the optizimal size base on current constraint
        return  view.systemLayoutSizeFitting(fittingSize,
                                             withHorizontalFittingPriority: .required,
                                             verticalFittingPriority: .defaultLow)
    }
}
