//
//  YZNumPadExampleViewController.swift
//  YZNumPadExample
//
//  Created by admin on 14/05/2019.
//  Copyright © 2019 YZO. All rights reserved.
//

import UIKit
import YZNumPad

// MARK: - YZNumPadExampleViewController
class YZNumPadExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Example"
        self.view.backgroundColor = .white
        
        var numPadConfig = YZNumPadViewConfiguration()
        numPadConfig.viewColor = .lightGray
        numPadConfig.borderColor = .darkGray
        numPadConfig.buttonColor = .magenta
        numPadConfig.textColor = .green
        numPadConfig.horizontalSpacing = 20
        numPadConfig.verticalSpacing = 20
        numPadConfig.buttonRadius = 25
        numPadConfig.buttonBorderWidth = 2
        numPadConfig.textSize = 20
        numPadConfig.deleteIcon = UIImage(named: "DeleteIcon")
        numPadConfig.decimalSeparator = "?"

        
        let numPadView = YZNumPadView(config: numPadConfig)
        numPadView.delegate = self
        
        self.view.addSubview(numPadView)
        numPadView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: numPadView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 100).isActive = true
        NSLayoutConstraint(item: numPadView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: numPadView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
    }
}

// MARK: - YZNumPadViewDelegate
extension YZNumPadExampleViewController: YZNumPadViewDelegate {
    
    func didTapNumber(_ number: Int, numPadView: YZNumPadView) {
         print("\(number)")
    }
    
    func didTapDecimapSeparator(_ decimapSeparator: String?, numPadView: YZNumPadView) {
        if let ds = decimapSeparator {
            print("\(ds)")
        } else {
            print("decimapSeparator")
        }
    }
    
    func didTapDelete(numPadView: YZNumPadView) {
        print("delete")
    }
}
