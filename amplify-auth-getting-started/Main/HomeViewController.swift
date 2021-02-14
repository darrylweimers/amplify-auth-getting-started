//
//  HomeViewController.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-14.
//

import UIKit

class HomeViewController : UIViewController {
    
    // MARK: ui components
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Welcome to the home page."
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupViews(superview: self.view)
    }
    
    // MARK: setup views
    func setupViews(superview: UIView) {
        superview.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            label.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -8),
        ])
    }
    
}
