//
//  ViewController.swift
//  3
//
//  Created by Lucas Ho on 07/03/2021.
//

import UIKit

protocol NameDelegate: class {
    
    func changeButtonName(newTitle: String?)
    
}

class ViewController: UIViewController {

    var pushBlueCircleViewControllerButton: UIButton!
    var pushRedSquareViewControllerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "test"
        view.backgroundColor = .white

        // Set the navigation controller's title!
        
        pushRedSquareViewControllerButton = UIButton()
        pushRedSquareViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushRedSquareViewControllerButton.setTitle("Red Square Arena", for: .normal)
        pushRedSquareViewControllerButton.setTitleColor(.white, for: .normal)
        pushRedSquareViewControllerButton.backgroundColor = .red
        pushRedSquareViewControllerButton.layer.cornerRadius = 4
        pushRedSquareViewControllerButton.addTarget(self, action: #selector(pushRedSquareViewController), for: .touchUpInside)
        view.addSubview(pushRedSquareViewControllerButton)
        
    
        pushBlueCircleViewControllerButton = UIButton()
        pushBlueCircleViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushBlueCircleViewControllerButton.setTitle("Blue Circle Arena", for: .normal)
        pushBlueCircleViewControllerButton.setTitleColor(.white, for: .normal)
        pushBlueCircleViewControllerButton.backgroundColor = .blue
        pushBlueCircleViewControllerButton.layer.cornerRadius = 4
        pushBlueCircleViewControllerButton.addTarget(self, action: #selector(pushBlueCircleViewController), for: .touchUpInside)
        view.addSubview(pushBlueCircleViewControllerButton)
          
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushRedSquareViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushRedSquareViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushRedSquareViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])

        NSLayoutConstraint.activate([
            pushBlueCircleViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushBlueCircleViewControllerButton.topAnchor.constraint(equalTo: pushRedSquareViewControllerButton.bottomAnchor, constant: 16),
            pushBlueCircleViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
    }

    
    @objc func pushBlueCircleViewController() {
        let newViewController = BlueCircleViewController()
        newViewController.delegate = self
        present(newViewController, animated: true, completion: nil)
    }

    @objc func pushRedSquareViewController() {
        let newViewController = RedSquareViewController()
        navigationController?.pushViewController(newViewController, animated: true)
        
/*
        let newViewController = RedSquareViewController(placeHolder: pushRedSquareViewControllerButton.titleLabel?.text ?? "placeholder")
        newViewController.delegate = self
        present(newViewController, animated: true, completion: nil)

 */
    }



}

extension ViewController: NameDelegate {
    
    func changeButtonName(newTitle: String?) {
        pushRedSquareViewControllerButton.setTitle(newTitle, for: .normal)
    }
    
}

