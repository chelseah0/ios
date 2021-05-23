//
//  CheeseTableViewCell.swift
//  p4
//
//  Created by Lucas Ho on 09/05/2021.
//

import UIKit

class CheeseTableViewCell: UITableViewCell {

    var nameLabel: UILabel!
    var ratingLabel: UILabel!
    var heartImageView: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)

        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = .systemFont(ofSize: 12)
        contentView.addSubview(ratingLabel)

        heartImageView = UIImageView(image: UIImage(named: "heart"))
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        contentView.addSubview(heartImageView)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {

        let padding: CGFloat = 8
        let heartImageWidth: CGFloat = 20
        let labelHeight: CGFloat = 16

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])

        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])

        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: heartImageWidth),
            heartImageView.widthAnchor.constraint(equalToConstant: heartImageWidth),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(for cheese: Cheese) {
        nameLabel.text = cheese.name
        ratingLabel.text = "Rating: \(cheese.getRatingString())"
    }

    func toggleHeart(for isFavourite: Bool) {
        heartImageView.isHidden = !isFavourite
    }

}
