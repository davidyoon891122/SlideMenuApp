//
//  MainViewController.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/04.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.configureNavigation()
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
