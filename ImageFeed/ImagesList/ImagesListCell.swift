//
//  File.swift
//  ImageFeed
//
//  Created by Pavel Barto on 02.06.2024.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    //MARK: Private Properties
    
    static let reuseIdentifier = "ImagesListCell"
    
    private lazy var cellImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 16
        img.layer.masksToBounds = true
        img.image = UIImage(named: "0")
        return img
    }()
    
    private lazy var likeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        return btn
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        let date = Date()
        label.text = date.dateTimeString
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    //MARK: Setup
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
         
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with image: String, and label: String) {
        self.cellImage.image = UIImage(named: image)
    }
    
    public func fillHeart() {
        likeButton.tintColor = #colorLiteral(red: 0.9607843137, green: 0.4196078431, blue: 0.4235294118, alpha: 1)
    }
    
    private func setupUI() {

        self.contentView.backgroundColor = .launchBG

        [cellImage,
         likeButton,
         cellLabel,
         ].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview($0)
        }
        
         
        
        NSLayoutConstraint.activate([
            cellImage.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            cellImage.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            cellImage.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor),

            
            cellLabel.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor,constant: 8),
            cellLabel.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor,constant: -8),
            
            likeButton.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor,constant: 12),
            likeButton.trailingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.trailingAnchor,constant: -10.5),
            likeButton.widthAnchor.constraint(equalToConstant: 21),
            likeButton.heightAnchor.constraint(equalToConstant: 18),
        ])

    }
    
    
    
}
