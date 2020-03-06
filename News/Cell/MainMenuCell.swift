//
//  MainMenuCell.swift
//  News
//
//  Created by sevima on 06/03/20.
//  Copyright © 2020 sevima. All rights reserved.
//

import UIKit
class MainMenuCell: UICollectionViewCell {
    let TYPE_EBOOK = "EBOOk"
       
    var btnTapAction : ((_ type: String)->())?
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    let ebookButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.setImage(UIImage(named: "author"), for: UIControl.State.normal)

        button.translatesAutoresizingMaskIntoConstraints = false

        return button;
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        addViews()
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }

    
    func addViews(){
        contentView.addSubview(ebookButton)
        
        ebookButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        ebookButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        ebookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ebookButton.widthAnchor.constraint(equalToConstant: 50).isActive = true

        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
    }
    
    @objc func ebookListener(){
        btnTapAction?(TYPE_EBOOK)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
