//
//  ViewController.swift
//  L4Starter
//
//  Created by Lucy Xu on 10/12/20.
//  Copyright © 2020 Lucy Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!

    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        setupConstraints()
    }

    func setupConstraints() {
//        Setup the constraints for our views
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
    }

}
