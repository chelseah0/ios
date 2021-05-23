//
//  HeaderView.swift
//  L5
//
//  Created by Lucas Ho on 23/05/2021.
//  Copyright © 2021 Kevin Chan. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
        
    private var label: UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // TODO 6a-i: styling for headerView.

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .gray
        addSubview(label)
        
        setupConstraints()
    }
    
    // TODO 6a-ii: constraints for headerView.

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setTitle(title: String) {
        label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
