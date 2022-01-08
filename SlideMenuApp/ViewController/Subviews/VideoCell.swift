//
//  VideoCell.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setLayoutConstraint()
    }
    
    func addSubviews() {
        
    }
    
    func setLayoutConstraint() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class VideoCell: BaseCell {
    private lazy var thumnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "paul_kim")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "singer")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "폴킴 - 있잖아"
        return label
    }()
    
    private lazy var subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "폴킴 있잖아 뮤직비디오 - 1,523,325 views - 3 years"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        textView.isEditable = false
        textView.backgroundColor = .clear
        return textView
    }()
    
    var titleLabelHeightConstraint: NSLayoutConstraint?
    
    func setVideo(video: Video) {
        guard let image = video.thumnailImageName,
              let singerImage = video.channel?.profileImageName,
              let channelName = video.channel?.name,
              let numberOfViews = video.numberOfViews,
              let title = video.title
        else {
            return
        }
        thumnailImageView.image = UIImage(named: image)
        titleLabel.text = title
        userProfileImageView.image = UIImage(named: singerImage)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let commaNumberOfView = numberFormatter.string(from: numberOfViews) else {
            return
        }
        
        let subtitleText = "\(channelName) • \(commaNumberOfView) • 2 years ago "
        subtitleTextView.text = subtitleText
        
        //measure title text
        let size = CGSize(width: frame.width - 16 - 44 - 8 - 16, height: 1000)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedRect = NSString(string: title)
            .boundingRect(with: size, options: option, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)], context: nil)
        
        if estimatedRect.size.height > 20 {
            titleLabelHeightConstraint?.constant = 44
        } else {
            titleLabelHeightConstraint?.constant = 20
        }
        
    }
    
    override func addSubviews() {
        self.addSubview(thumnailImageView)
        self.addSubview(userProfileImageView)
        self.addSubview(titleLabel)
        self.addSubview(subtitleTextView)
        self.addSubview(separatorView)
    }
    
    override func setLayoutConstraint() {
        self.thumnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        self.thumnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.thumnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        self.userProfileImageView.topAnchor.constraint(equalTo: self.thumnailImageView.bottomAnchor, constant: 8).isActive = true
        self.userProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        self.userProfileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        self.userProfileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.userProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -35).isActive = true
        
        self.titleLabel.topAnchor.constraint(equalTo: self.thumnailImageView.bottomAnchor, constant: 8).isActive = true
        self.titleLabel.leadingAnchor.constraint(equalTo: self.userProfileImageView.trailingAnchor, constant: 8).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.thumnailImageView.trailingAnchor).isActive = true
        titleLabelHeightConstraint = self.titleLabel.heightAnchor.constraint(equalToConstant: 44)
        titleLabelHeightConstraint?.isActive = true
        
        self.subtitleTextView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4).isActive = true
        self.subtitleTextView.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        self.subtitleTextView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.subtitleTextView.trailingAnchor.constraint(equalTo: self.thumnailImageView.trailingAnchor).isActive = true
        
        
        self.separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        self.separatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        self.separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
    }
}




