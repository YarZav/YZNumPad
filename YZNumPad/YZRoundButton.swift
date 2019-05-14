//
//  YZRoundButton.swift
//  YZNumPad
//
//  Created by admin on 14/05/2019.
//  Copyright © 2019 YZO. All rights reserved.
//

import UIKit

// MAKR: - YZRoundButton
open class YZRoundButton: UIButton {
    
    //Properties
    public var bckGroundColor: UIColor = .white
    
    //Init
    public init(backgroundColor: UIColor, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        super.init(frame: .zero)
        self.createUI(backgroundColor: backgroundColor, radius: radius, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createUI(backgroundColor: .white, radius: 450, borderColor: .black, borderWidth: 1)
    }
}

// MARK: - Privates
extension YZRoundButton {
    
    private func createUI(backgroundColor: UIColor, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.bckGroundColor = backgroundColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
    }
}
