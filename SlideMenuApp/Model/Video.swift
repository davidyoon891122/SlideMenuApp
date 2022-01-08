//
//  Video.swift
//  SlideMenuApp
//
//  Created by David Yoon on 2022/01/06.
//

import UIKit

class Video: Decodable {
    var thumnailImageName: String?
    var title: String?
    //var subtitle: String?
    var numberOfViews: Double?
    //var uploadDate: NSDate?
    var channel: Channel?
    var duration: Double?
    
    enum CodingKeys: String, CodingKey {
        case title, duration, channel
        case thumnailImageName = "thumbnail_image_name"
        case numberOfViews = "number_of_views"
    }
}

class Channel: Decodable {
    var name: String?
    var profileImageName: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageName = "profile_image_name"
    }
    
}
