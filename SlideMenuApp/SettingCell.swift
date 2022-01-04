//
//  SettingCell.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit




class SettingCell: UICollectionViewCell {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gearshape.fill")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.addSubview(self.iconImageView)
        self.addSubview(self.nameLabel)
    }
    
    func setLayoutConstraints() {
        self.iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.nameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 8).isActive = true
        self.nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
