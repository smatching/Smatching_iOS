//
//  UILabel+extension.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2019. 1. 9..
//  Copyright © 2019년 shineeseo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    var numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
