//
//  ViewController.swift
//  PseudoConstraintsExample
//
//  Created by Zain on 01/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import UIKit
import PseudoConstraints

class ViewController: UIViewController {
    
    // MARK: Views
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pseudo Constraints"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .darkText
        return label
    }()
    
    private lazy var detailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pseudo Constraints let's you set constraints programatically with less code. Pseudo Constraints uses native Swift APIs at its core hence making it more efficient."
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        return label
    }()
    
    // MARK: View cycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        title = "Pseudo Constraints"
        
        setupViews()
        setupConstraints()
    }
}

// MARK: View setup

private extension ViewController {
    func setupViews() {
        view.addSubview(headingLabel)
        view.addSubview(detailsLabel)
        
        view.backgroundColor = .white
    }
    
    func setupConstraints() {
        
        headingLabel
            .alignEdgeWithSuperviewSafeArea(.top, constant: 45)
            .alignEdgesWithSuperview([.left, .right], constant: 25)
        
        detailsLabel
            .below(headingLabel, constant: 15)
            .centerHorizontallyInSuperview()
            .alignEdgeWithSuperviewSafeArea(.left, constant: 25)
    }
}
