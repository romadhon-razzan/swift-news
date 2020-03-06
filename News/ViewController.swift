//
//  ViewController.swift
//  News
//
//  Created by Romadhon Akbar Sholeh on 06/03/20.
//  Copyright © 2020 sevima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCell
        cell.btnTapAction = {
            (_ type: String) in
            print("Comment tapped in cell", indexPath, " Type : ", type)
        }
        
        if indexPath.item == 0{
            let mainMenu = collectionview.dequeueReusableCell(withReuseIdentifier: cellMainMenu, for: indexPath) as! MainMenuCell
            return mainMenu
        }
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("CLICK ",indexPath.item)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        layout.estimatedItemSize = CGSize(width: view.bounds.size.width, height: 10)
        layout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    var collectionview : UICollectionView!
    var cellId = "cell"
    var cellMainMenu = "cellMainMenu"
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 10)
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let height: CGFloat = 75
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: height))
        navBar.backgroundColor = .white
        self.view.addSubview(navBar)

        let navItem = UINavigationItem()
        navItem.title = "News"
        
        let profileItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: nil)
        navItem.leftBarButtonItem  = profileItem
        
        let addItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(createPost))
        navItem.rightBarButtonItem = addItem

        navBar.setItems([navItem], animated: false)

        collectionview = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionview?.frame = CGRect(x: 0, y: height, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height - height))

        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(NewsCell.self, forCellWithReuseIdentifier: cellId)
        collectionview.register(MainMenuCell.self, forCellWithReuseIdentifier: cellMainMenu)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.view.addSubview(collectionview)
        
    }
    
    @objc func createPost(){
        let window = UIWindow()
        let nav1 = UINavigationController()
        let mainView = PostCreatorController()
        nav1.viewControllers = [mainView]
        window.rootViewController = nav1
        window.makeKeyAndVisible()
    }
}

