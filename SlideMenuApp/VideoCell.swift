//
//  VideoCell.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class VideoCell: UICollectionViewCell {
    
    private lazy var thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .red
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setLayoutConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



private extension VideoCell {
    func addSubviews() {
        self.addSubview(thumnailImageView)
        self.addSubview(userProfileImageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleTextView)
        self.addSubview(separatorView)
    }
    
    func setLayoutConstraint() {
        self.thumnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        self.thumnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.thumnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        self.userProfileImageView.topAnchor.constraint(equalTo: self.thumnailImageView.bottomAnchor, constant: 8).isActive = true
        self.userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.userProfileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        self.userProfileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.userProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        
        self.titleLabel.topAnchor.constraint(equalTo: self.thumnailImageView.bottomAnchor, constant: 8).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.userProfileImageView.trailingAnchor, constant: 8).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.thumnailImageView.trailingAnchor).isActive = true
        self.titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.subtitleTextView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4).isActive = true
        self.subtitleTextView.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        self.subtitleTextView.bottomAnchor.constraint(equalTo: self.userProfileImageView.bottomAnchor).isActive = true
        self.subtitleTextView.trailingAnchor.constraint(equalTo: self.thumnailImageView.trailingAnchor).isActive = true
        
        
        self.separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.separatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
}
