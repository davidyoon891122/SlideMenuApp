//
//  MainViewController.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class HomeViewController: UICollectionViewController {
    private var videos: [Video]?
    private let cellId = "cellId"
    private lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    
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
        fetchVideos()
        
    }
    
    func showControllerForSettings(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
    }

}

extension HomeViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let videos = self.videos else {
            return 0
        }
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        guard let videos = self.videos else {
            return UICollectionViewCell()
        }
        let video = videos[indexPath.row]
        cell.setVideo(video: video)
        return cell
    }
    
    func fetchVideos() {
        ApiService.shardInstance.fetchVideos { videos in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 32) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
}


private extension HomeViewController {
    func configureNavigation() {

        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(tapSettingButton))
        let rightSearchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(tapSettingButton))
        
        [rightSettingButton, rightSearchButton]
            .forEach{
                $0.tintColor = .label
            }
        
        self.navigationItem.rightBarButtonItems = [rightSettingButton, rightSearchButton]
        
        
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
        navigationController?.hidesBarsOnSwipe = true
        menuBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        let menuBarBackView = UIView()
//        menuBarBackView.backgroundColor = .systemBackground
//        view.addSubview(menuBarBackView)
//        menuBarBackView.translatesAutoresizingMaskIntoConstraints = false
//        menuBarBackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        menuBarBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        menuBarBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        menuBarBackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    
    
}
