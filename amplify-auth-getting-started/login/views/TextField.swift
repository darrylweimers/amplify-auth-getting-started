//
//  TextField.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-06.
//

import UIKit

class TextField : UIView {
    
    lazy var textFieldStackView: UIStackView = {
        let subviews: [UIView] = [iconImageView, textField]
        let stackView = UIStackView(arrangedSubviews: subviews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var defaultImage: UIImage? = {
       let image = UIImage(systemName: "clear")
        return image
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.widthAnchor.constraint(equalToConstant: 32),
        ])
        return imageView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.textColor = .black
        textField.backgroundColor = .clear
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(superview: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(superview: UIView) {
        superview.addSubview(textFieldStackView)

        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: superview.topAnchor),
            textFieldStackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            textFieldStackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            textFieldStackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        ])
    }
}
