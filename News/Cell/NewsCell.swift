//
//  NewsCell.swift
//  News
//
//  Created by sevima on 06/03/20.
//  Copyright © 2020 sevima. All rights reserved.
//

import UIKit
class NewsCell: UICollectionViewCell {
    let TYPE_OPTIONS = "OPTIONS"
    let TYPE_COMMENT = "COMMENT"
    let TYPE_SHARE = "SHARE"

    var btnTapAction : ((_ type: String)->())?
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()

    let profileImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.darkGray
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        button.setImage(UIImage(named: "author"), for: UIControl.State.normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.text = "Bob Lee"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let distanceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "1 hour ago"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let optionsButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named: "more"), for: UIControl.State.normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let showCaseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.image = UIImage(named: "react")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let title: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        label.text = "Pemrograman Web using React Js is the best"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let content: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        label.text = "React makes it painless to create interactive UIs. Design simple views for each state in your application, and React will efficiently update and render just the right components when your data changes. Declarative views make your code more predictable and easier to debug."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let topSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for:  UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.blue, for:  UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    @objc let commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("10 Comment", for:  UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.blue, for:  UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis  = NSLayoutConstraint.Axis.horizontal
        sv.alignment = UIStackView.Alignment.center
        sv.distribution = UIStackView.Distribution.fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false;
        return sv
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
        backgroundColor = UIColor.white

        contentView.addSubview(profileImageButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview(distanceLabel)
        contentView.addSubview(optionsButton)
        contentView.addSubview(showCaseImageView)
        contentView.addSubview(title)
        contentView.addSubview(content)
        contentView.addSubview(topSeparatorView)

        // Stack View
        contentView.addSubview(shareButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(stackView)


        profileImageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5).isActive = true
        profileImageButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        profileImageButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        profileImageButton.widthAnchor.constraint(equalToConstant: 36).isActive = true

        nameLabel.leftAnchor.constraint(equalTo: profileImageButton.rightAnchor, constant: 5).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: profileImageButton.centerYAnchor, constant: -8).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: optionsButton.leftAnchor).isActive = true

        distanceLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        distanceLabel.centerYAnchor.constraint(equalTo: profileImageButton.centerYAnchor, constant: 8).isActive = true
        
        // Distance depeneded on the priceLabel and distance Label
        optionsButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        optionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        optionsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        optionsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        optionsButton.addTarget(self, action: #selector(optionsListener), for: .touchUpInside)

        showCaseImageView.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 10).isActive = true
        showCaseImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        showCaseImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width-100).isActive = true

        title.topAnchor.constraint(equalTo: showCaseImageView.bottomAnchor, constant: 10).isActive = true
        title.leftAnchor.constraint(equalTo: profileImageButton.leftAnchor, constant: 5).isActive = true
        
        content.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        content.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        content.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  -10).isActive = true

        topSeparatorView.topAnchor.constraint(equalTo: content.bottomAnchor, constant: 10).isActive = true
        topSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        stackView.addArrangedSubview(shareButton)
        stackView.addArrangedSubview(commentButton)
        shareButton.addTarget(self, action: #selector(shareListener), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentListener), for: .touchUpInside)

        stackView.topAnchor.constraint(equalTo: topSeparatorView.bottomAnchor, constant: 4).isActive = true
        stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func optionsListener() {
        btnTapAction?(TYPE_OPTIONS)
    }
    
    @objc func commentListener() {
        btnTapAction?(TYPE_COMMENT)
    }
    
    @objc func shareListener() {
        btnTapAction?(TYPE_SHARE)
    }

}
