//
//  MainViewController.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var videos: [Video] = {
        var davidChannel = Channel()
        davidChannel.name = "DavidyoonIsTheBestChannel"
        davidChannel.profileImageName = "singer"
        
        var firstVideo = Video()
        firstVideo.title = "폴킴 - 있잖아"
        firstVideo.thumnailImageName = "paul_kim"
        firstVideo.subtitle = "폴킴 있잖아 뮤직비디오 - 1,523,325 views - 3 years"
        firstVideo.numberOfViews = 1293028193
        firstVideo.channel = davidChannel
        
        var secondVideo = Video()
        secondVideo.title = "폴킴 - 너를 만나"
        secondVideo.thumnailImageName = "meetyou"
        secondVideo.subtitle = "폴킴 너를만나 뮤직비디오 - 112,321,523,325 views - 5 years - The Best Album of Paul Kim!"
        secondVideo.numberOfViews = 12930235328193
        secondVideo.channel = davidChannel
        
        var thirdVideo = Video()
        thirdVideo.title = "폴킴 - 있잖아폴킴 - 있잖아폴킴 - 있잖아폴킴 - 있잖아폴킴 - 있잖아폴킴 - 있잖아"
        thirdVideo.thumnailImageName = "paul_kim"
        thirdVideo.subtitle = "폴킴 있잖아 뮤직비디오 - 1,523,325 views - 3 years"
        thirdVideo.numberOfViews = 12930532528193
        thirdVideo.channel = davidChannel
        
        var fourthVideo = Video()
        fourthVideo.title = "폴킴 - 너를 만나"
        fourthVideo.thumnailImageName = "meetyou"
        fourthVideo.subtitle = "폴킴 있잖아 뮤직비디오 - 1,523,325 views - 3 years"
        fourthVideo.numberOfViews = 1293028342352193
        fourthVideo.channel = davidChannel
        
        return [firstVideo, secondVideo, thirdVideo, fourthVideo]
    }()
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
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! VideoCell
        let video = videos[indexPath.row]
        cell.setVideo(video: video)
        return cell
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
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
