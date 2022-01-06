//
//  MainViewController.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private let cellId = "cellId"
    private let settingsLauncher = SettingsLauncher()
    private lazy var menuBar:MenuBar = {
        let menuBar = MenuBar()
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        return menuBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configureNavigation()
        configureCollectionView()
        configureMenuBar()
        
    }
    
    

}

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        return cell
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 60)
    }
}


private extension HomeViewController {
    func configureNavigation() {

        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(tapSettingButton))
        
        self.navigationItem.rightBarButtonItem = rightSettingButton
        self.navigationItem.rightBarButtonItem?.tintColor = .label
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        
        textView.text = "Home"
        textView.textColor = .label
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .clear
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        textView.isEditable = false
        
        navigationItem.titleView = textView
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
    }
   
    @objc func tapSettingButton() {
        settingsLauncher.showSettings()
    }
    
    func configureCollectionView() {
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    
    func configureMenuBar() {
        view.addSubview(menuBar)
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
