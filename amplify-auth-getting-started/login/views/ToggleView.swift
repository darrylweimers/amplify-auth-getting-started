//
//  ToggleView.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-07.
//

import UIKit

class ToggleView : UIView {
    lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textAlignment = .right
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(.systemBlue, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(superview: self)
    }
    
    func setupViews(superview: UIView) {
        self.addSubview(label)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: superview.topAnchor),
            label.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -4),
            button.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            
            button.firstBaselineAnchor.constraint(equalTo: label.firstBaselineAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
