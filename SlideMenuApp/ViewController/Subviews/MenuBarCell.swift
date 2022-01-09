//
//  MenuBarCell.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/06.
//

import UIKit

class MenuBarCell: BaseCell {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .darkGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? .label : .darkGray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? .label : .darkGray
        }
    }
    
    override func addSubviews() {
        super.addSubviews()
        addSubview(imageView)
    }
    
    override func setLayoutConstraint() {
        super.setLayoutConstraint()

        imageView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}


