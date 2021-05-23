//
//  ViewController.swift
//  L3
//
//  Created by Omar Rasheed on 3/10/20.
//  Copyright © 2020 Cornell Appdev. All rights reserved.
//

import UIKit

protocol NameDelegate: class {
    
    func changeButtonName(newTitle: String?)
    
}

class ViewController: UIViewController {

    var pushNavViewControllerButton: UIButton!
    var presentRedViewControllerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Set the navigation controller's title!

        pushNavViewControllerButton = UIButton()
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("Push Navigation VC", for: .normal)
        pushNavViewControllerButton.setTitleColor(.blue, for: .normal)
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)

        presentRedViewControllerButton = UIButton()
        presentRedViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentRedViewControllerButton.setTitle("Present Modal VC [change my name]", for: .normal)
        presentRedViewControllerButton.setTitleColor(.red, for: .normal)
        presentRedViewControllerButton.addTarget(self, action: #selector(presentRedViewController), for: .touchUpInside)
        view.addSubview(presentRedViewControllerButton)

        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])

        NSLayoutConstraint.activate([
            presentRedViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentRedViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 16),
            presentRedViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }

    @objc func pushNavViewController() {
        let newViewController = BlueViewController()
        navigationController?.pushViewController(newViewController, animated: true)
    }

    @objc func presentRedViewController() {
        let newViewController = RedViewController(placeHolder: presentRedViewControllerButton.titleLabel?.text ?? "placeholder")
        newViewController.delegate = self
        present(newViewController, animated: true, completion: nil)
    }
}

// This is an extension of a ViewController. Typically, you use these to break up your ViewControllers
// into smaller, more well-defined chunks. You could implement this inside the body of code up above,
// and have the class be
//
// class ViewController: UIViewController, ChangeButtonTitleDelegate { ... }
//
// But this is more readable, because you know only this code is what you implemented so that
// other view controllers can call this function to change the button's title.
//
// In this case, ViewController now must implement the methods declared by the protocol
// ChangeButtonTitleDelegate. It's very similar to Java syntax in that regard.
extension ViewController: NameDelegate {
    
    func changeButtonName(newTitle: String?) {
        presentRedViewControllerButton.setTitle(newTitle, for: .normal)
    }
    
}

