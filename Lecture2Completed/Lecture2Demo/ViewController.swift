//
//  ViewController.swift
//  Lecture2Demo
//
//  Created by Lucy Xu on 9/28/20.
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
//        nameLabel.textColor = UIColor.black
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
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        view.addSubview(followButton)

        textView = UITextView()
        textView.text = "Bill Gates is a technologist, business leader, and philanthropist. He grew up in Seattle, Washington, with an amazing and supportive family who encouraged his interest in computers at an early age. He dropped out of college to start Microsoft with his childhood friend Paul Allen. Gates was born William Henry Gates III on October 28, 1955, in Seattle, Washington. Gates grew up in an upper-middle-class family with his older sister, Kristianne, and younger sister, Libby. Their father, William H. Gates Sr., was a promising, if somewhat shy, law student when he met his future wife, Mary Maxwell. She was an athletic, outgoing student at the University of Washington, actively involved in student affairs and leadership.The Gates family atmosphere was warm and close, and all three children were encouraged to be competitive and strive for excellence. Gates showed early signs of competitiveness when he coordinated family athletic games at their summer house on Puget Sound. He also relished in playing board games (Risk was his favorite) and excelled at Monopoly."
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
            followButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 15),
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

