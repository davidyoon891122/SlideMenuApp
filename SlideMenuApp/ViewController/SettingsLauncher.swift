//
//  SettingsLauncher.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class Setting: NSObject {
    let name: SettingName
    let imageName: String
    
    init(name: SettingName, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}


enum SettingName: String {
    case Cancel = "Cancel"
    case Policy = "Terms & privacy policy"
    case FeedBack = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
    case Settings
}


class SettingsLauncher: NSObject {
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
    private let cellId = "cellId"
    private let cellHeight:CGFloat = 50.0
    weak var homeController: HomeViewController?
    
    private let settings: [Setting] = {
        return [
            Setting(name: SettingName.Settings, imageName: "gearshape.fill"),
            Setting(name: SettingName.Policy, imageName: "gearshape.fill"),
            Setting(name: SettingName.FeedBack, imageName: "gearshape.fill"),
            Setting(name: SettingName.Help, imageName: "gearshape.fill"),
            Setting(name: SettingName.SwitchAccount, imageName: "gearshape.fill"),
            Setting(name: SettingName.Cancel, imageName: "gearshape.fill")
        ]
    }()
    
    override init() {
        super.init()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    func showSettings() {
        if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}) {
            print("setting button tapped")
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapBlackView(setting:))))
            
            
            window.addSubview(blackView)
            window.addSubview(collectionView)
            
            let height:CGFloat = CGFloat(settings.count) * cellHeight
            let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect(x: 0,
                                                   y: y,
                                                   width: self.collectionView.frame.width,
                                                   height: self.collectionView.frame.height
                )
            }, completion: nil)
        }
    }
    
}

extension SettingsLauncher: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        let setting = settings[indexPath.row]
        cell.setting = setting
        return cell
    }

}

extension SettingsLauncher: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let setting = self.settings[indexPath.item]
        tapBlackView(setting: setting)
        
    }
}


extension SettingsLauncher: UICollectionViewDelegate {
    
}


private extension SettingsLauncher {
    
    
    @objc func tapBlackView(setting: Setting) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut) {
            
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.windows.first(where: {$0.isKeyWindow}){
                self.collectionView.frame = CGRect(
                    x: 0,
                    y: window.frame.height,
                    width: self.collectionView.frame.width,
                    height: self.collectionView.frame.height)
            }
        } completion: { [weak self] done in
            guard let self = self else { return }
            print(setting)
            if setting.name != .Cancel {
                self.homeController?.showControllerForSettings(setting: setting)
            }
                
            
        }
    }
}
