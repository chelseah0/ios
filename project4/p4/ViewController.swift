//
//  ViewController.swift
//  p4
//
//  Created by Lucas Ho on 25/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    let reuseIdentifier = "cheeseCellReuse"
    let cellHeight: CGFloat = 75

    let mozarella = Cheese(name: "mozarella", isFavourite: false, rating: .nice)
    let brie = Cheese(name: "brie", isFavourite: false, rating: .decent)
    let cheddar = Cheese(name: "cheddar", isFavourite: false, rating: .decent)
    let ricotta = Cheese(name: "rictta", isFavourite: false, rating: .nice)
    let gruyere = Cheese(name: "gruyere", isFavourite: false, rating: .alright)
    
    var cheeses: [Cheese]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cheeses = [mozarella, brie, cheddar, ricotta, gruyere]
        title = "types of cheese"
        view.backgroundColor = .white
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CheeseTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cheeses.count
    }
    
    func tableView( _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            reuseIdentifier, for: indexPath) as! CheeseTableViewCell
        let cheese = cheeses[indexPath.row]
        cell.configure(for: cheese)
        return cell
    }
    
}
extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cheese = cheeses[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! CheeseTableViewCell
        cheese.isFavourite.toggle()
        cell.toggleHeart(for: cheese.isFavourite)
    }
}
