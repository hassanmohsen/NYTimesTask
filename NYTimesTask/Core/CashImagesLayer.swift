//
//  CashImagesLayer.swift
//  NYTimesTask
//
//  Created by Hassan on 12/7/20.
//  Copyright © 2020 Hassan. All rights reserved.
//

import Foundation
import UIKit



struct CashImagesLayer {
    static func cashImage(imageView : UIImageView , imgUrl : String?) -> Void {
        imageView.moa.url = imgUrl
    }
}
