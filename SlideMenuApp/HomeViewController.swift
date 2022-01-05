//
//  MainViewController.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.configureNavigation()
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func configureNavigation() {
        self.navigationItem.title = "Home"
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(tapSettingButton))
        
        self.navigationItem.rightBarButtonItem = rightSettingButton
    }
    let settingsLauncher = SettingsLauncher()
    @objc func tapSettingButton() {
        settingsLauncher.showSettings()
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
        return CGSize(width: view.frame.width, height: 200)
    }
}
