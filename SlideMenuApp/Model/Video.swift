//
//  Video.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/06.
//

import UIKit

class Video: NSObject {
    var thumnailImageName: String?
    var title: String?
    var subtitle: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
    
}
