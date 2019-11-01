//
//  Banner.swift
//  seminar21
//
//  Created by 천유정 on 26/10/2019.
//  Copyright © 2019 yujeong. All rights reserved.
//

import Foundation
import UIKit
struct Banner {
    var bannerImg: UIImage?
    
    init(bannerName : String) {
        self.bannerImg = UIImage(named: bannerName)
        
    }
}
