//
//  File.swift
//  ImageFeed
//
//  Created by Pavel Barto on 02.06.2024.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    //MARK: - Private Properties
    
    static let reuseIdentifier = "ImagesListCell"
    
//    lazy private var gradientLabelView: UIView = {
//        let view = UIView()
////        view.layer.masksToBounds = true
//        return view
//    }()
    
    lazy private var gradientImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "gradient")
        return img
    }()
    
    lazy var cellImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 16
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    lazy var likeButton: UIButton = {
        let btn = UIButton()
        return btn
    }()
    
    private lazy var cellLabel: UILabel = {
        let label = UILabel()
        let date = Date()
        label.text = date.dateTimeString
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI-Setup
    private func setupViews() {
//        gradientLabelView.addGradient([UIColor.blue, UIColor.red], frame: self.frame)
        self.contentView.backgroundColor = .launchBG
        
        [cellImage,
//         gradientLabelView,
         likeButton,
         cellLabel,
         gradientImage].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.contentView.addSubview($0)
        }
    }
//        gradientLabelView.addSubview(cellLabel)
//        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        //MARK: - Constraints
        private func setupConstraints() {
            //MARK: Constraints
            NSLayoutConstraint.activate([
                cellImage.topAnchor.constraint(equalTo: topAnchor, constant: 4),
                cellImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
                cellImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                cellImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                
                cellLabel.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor, constant: 8),
                cellLabel.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: -8),
                
                likeButton.topAnchor.constraint(equalTo: cellImage.topAnchor),
                likeButton.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor),
                likeButton.widthAnchor.constraint(equalToConstant: 44),
                likeButton.heightAnchor.constraint(equalToConstant: 44),
                
                //            gradientLabelView.topAnchor.constraint(equalTo: cellLabel.topAnchor),
                //            gradientLabelView.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor),
                //            gradientLabelView.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
                //            gradientLabelView.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor),
                
                gradientImage.topAnchor.constraint(equalTo: cellLabel.topAnchor),
                gradientImage.bottomAnchor.constraint(equalTo: cellImage.bottomAnchor),
                gradientImage.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
                gradientImage.trailingAnchor.constraint(equalTo: cellImage.trailingAnchor),
                
            ])
        
    }
    
}

//MARK: Extensions. Разобраться позже

//extension UIView {
//   func addGradient(_ colors: [UIColor], frame: CGRect = .zero) {
//      let gradientLayer = CAGradientLayer()
//      gradientLayer.colors = colors.map{ $0.cgColor }
//      gradientLayer.frame = frame
//      layer.addSublayer(gradientLayer)
//   }
//}
