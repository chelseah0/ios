//
//  ViewController.swift
//  demo2
//
//  Created by Lucas Ho on 07/02/2021.
//

import UIKit

class ViewController: UIViewController {

    var nameLabel: UILabel!
    var imageView: UIImageView!
    var followButton: UIButton!
    var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
        nameLabel = UILabel()
        nameLabel.text = "Bill Gates"
 //       nameLabel.textColor = UIColor.black
        nameLabel.textColor = .black
//        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "billgates")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.blue, for: .normal)
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.blue.cgColor
        //followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpinside)
        view.addSubview(followButton)
        
        textView = UITextView()
        textView.text = "Bill Gates, in full William Henry Gates III, (born October 28, 1955, Seattle, Washington, U.S.), American computer programmer and entrepreneur who cofounded Microsoft Corporation, the world's largest personal-computer software company. Gates wrote his first software program at the age of 13. In high school he helped form a group of programmers who computerized their school’s payroll system and founded Traf-O-Data, a company that sold traffic-counting systems to local governments. In 1975 Gates, then a sophomore at Harvard University, joined his hometown friend Paul G. Allen to develop software for the first microcomputers. They began by adapting BASIC, a popular programming language used on large computers, for use on microcomputers. With the success of this project, Gates left Harvard during his junior year and, with Allen, formed Microsoft. Gates’s sway over the infant microcomputer industry greatly increased when Microsoft licensed an operating system called MS-DOS to International Business Machines Corporation—then the world’s biggest computer supplier and industry pacesetter—for use on its first microcomputer, the IBM PC (personal computer). After the machine’s release in 1981, IBM quickly set the technical standard for the PC industry, and MS-DOS likewise pushed out competing operating systems. While Microsoft’s independence strained relations with IBM, Gates deftly manipulated the larger company so that it became permanently dependent on him for crucial software. Makers of IBM-compatible PCs, or clones, also turned to Microsoft for their basic software. By the start of the 1990s he had become the PC industry’s ultimate kingmaker."
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        view.addSubview(textView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant : 15),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
        
    }


    @objc func followButtonTapped() {
        
        if followButton.currentTitle == "Follow" {
            followButton.setTitle("Following", for: .normal)
            followButton.setTitleColor(.white, for: .normal)
            followButton.backgroundColor = .blue
        } else {
            followButton.setTitle("Follow", for: .normal)
            followButton.setTitleColor(.blue, for: .normal)
            followButton.backgroundColor = .white
        }
    }
}

