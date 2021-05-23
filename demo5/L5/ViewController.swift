//
//  ViewController.swift
//  L5
//
//  Created by Kevin Chan on 8/25/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Views
    private var collectionView: UICollectionView!
    
    // Data
    private var colors: [[Color]] = []
    private var sections: [String] = []

    // Constants
    private let colorCellReuseIdentifier = "colourCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 8
    private let sectionPadding: CGFloat = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        sections = ["Neutrals", "Warm Colours", "Cool Colours"]
        colors = [[
            Color(color: UIColor(red: 94/255, green: 94/255, blue: 94/255, alpha: 1), hex: "#5e5e5e"),
            Color(color: UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1), hex: "#a3a3a3"),
        ], [
            Color(color: UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1), hex: "#ff9500"),
            Color(color: UIColor(red: 255/255, green: 191/255, blue: 0/255, alpha: 1), hex: "#ffbf00"),
            Color(color: UIColor(red: 255/255, green: 89/255, blue: 0/255, alpha: 1), hex: "#ff5900"),
            Color(color: UIColor(red: 224/255, green: 34/255, blue: 0/255, alpha: 1), hex: "#e02200")
        ], [
            Color(color: UIColor(red: 68/255, green: 126/255, blue: 201/255, alpha: 1), hex: "#447ec9"),
            Color(color: UIColor(red: 122/255, green: 158/255, blue: 204/255, alpha: 1), hex: "#7a9ecc"),
            Color(color: UIColor(red: 21/255, green: 39/255, blue: 87/255, alpha: 1), hex: "#152757"),
            Color(color: UIColor(red: 23/255, green: 164/255, blue: 207/255, alpha: 1), hex: "#17a4cf"),
            Color(color: UIColor(red: 113/255, green: 28/255, blue: 217/255, alpha: 1), hex: "#711cd9"),
            Color(color: UIColor(red: 50/255, green: 8/255, blue: 158/255, alpha: 1), hex: "#32089e")
        ]]
        
        // TODO 2: Setup flow layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        // TODO 1: Instantiate collectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        // TODO 3: Create collection view cell and register it here.
        // TODO 3a: Add content to collection view cell.
        // TODO 3b: Create function to configure collection view cell.
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: colorCellReuseIdentifier)
        // TODO 6: Create section header and register it here.
        // TODO 6a: Add content to section header.
        // TODO 6b: Create function to configure section header.
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        // TODO 4: Extend collection view data source.
        collectionView.dataSource = self

        // TODO 5: Extend collection view delegate.
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        setupConstraints()
    }

    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    // TODO 4b: specify number of items in section (required).
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors[section].count
    }
    
    // TODO 4a: specify cell to return (required).
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: colorCellReuseIdentifier, for: indexPath) as! ColorCollectionViewCell
        
        cell.configure(for: colors[indexPath.section][indexPath.item])
        return cell
    }
    
    // TODO 4c: specify number of sections (optional, defaults to 1).
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    // TODO 7: Specify rendering for header.
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        header.setTitle(title: sections[indexPath.section])
        return header
    }
}



extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    // TODO 5a: override default flow (optional, has default flow).
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLAyout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize {
        let size = (collectionView.frame.width - cellPadding) / 2.0
        return CGSize(width: size, height: size)
    }
    
    // TODO 8: Specify size for header.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.height, height: 48.0)
    }
    
    // TODO 9: provide selection functionality.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colors[indexPath.section][indexPath.item].selected = !colors[indexPath.section][indexPath.item].selected
        collectionView.reloadData()
    }
}

