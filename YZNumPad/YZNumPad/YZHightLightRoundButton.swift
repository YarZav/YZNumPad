//
//  YZHightLightRoundButton.swift
//  YZNumPad
//
//  Created by admin on 14/05/2019.
//  Copyright © 2019 YZO. All rights reserved.
//

import UIKit

// MARK: - YZHightLightRoundButton round button
open class YZHightLightRoundButton: YZRoundButton {
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .lightGray : self.bckGroundColor
        }
    }
}
