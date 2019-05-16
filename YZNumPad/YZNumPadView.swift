//
//  YZNumPadView.swift
//  YZNumPad
//
//  Created by admin on 14/05/2019.
//  Copyright © 2019 YZO. All rights reserved.
//

import UIKit

// MARK: - YZNumPadViewDelegate
public protocol YZNumPadViewDelegate: class {
    func didTapNumber(_ number: Int, numPadView: YZNumPadView)                           // Tap number
    func didTapDecimapSeparator(_ decimapSeparator: String?, numPadView: YZNumPadView)   // Tap decimal separate point
    func didTapDelete(numPadView: YZNumPadView)                                          // Tap delete
}

// MARK: - YZNumPadViewStruct
public struct YZNumPadViewConfiguration {
    public var viewColor: UIColor = .white                                     // View Background color
    public var borderColor: UIColor = .black                                   // Button border color
    public var buttonColor: UIColor = .white                                   // Button background color
    public var textColor: UIColor = .black                                     // Button text color
    public var horizontalSpacing: CGFloat = 8.0                                // Horizontal spasing bweetn button
    public var verticalSpacing: CGFloat = 8.0                                  // Vertical spacing between button
    public var buttonRadius: CGFloat = 35                                      // Button button radius
    public var buttonBorderWidth: CGFloat = 1                                  // Button border width
    public var textSize: CGFloat = 17                                          // Text size in button
    public var deleteIcon: UIImage?                                            // Delete icon for button
    public var decimalSeparator: String? = Locale.current.decimalSeparator     // Decimal separator
    
    public init() { }
}


/// Tags for number pad
//  1   2   3
//  4   5   6
//  7   8   9
//  10(separator)  0  11(delete)

// MARK: - YZNumPadView
open class YZNumPadView: UIView {
    
    public weak var delegate: YZNumPadViewDelegate?         //Subscribe to get notification when button tapped
    private var config = YZNumPadViewConfiguration()        //Configuration UI
    private var numTag: Int = 1
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.createUI()
    }
    
    public init(config: YZNumPadViewConfiguration) {
        self.config = config
        super.init(frame: .zero)
        self.createUI()
    }
}

// MARK: - Actions
extension YZNumPadView {
    
    @objc private func roundButtonAction(sender: UIButton) {
        switch sender.tag {
        case 10:        self.delegate?.didTapDecimapSeparator(self.config.decimalSeparator, numPadView: self)
        case 11:        self.delegate?.didTapDelete(numPadView: self)
        case 0...9:     self.delegate?.didTapNumber(sender.tag, numPadView: self)
        default:        break
        }
    }
}

// MARK: - Private methods
extension YZNumPadView {
    
    //Create UI
    private func createUI() {
        self.backgroundColor = self.config.viewColor
        
        let stackView = self.createStackView(axis: .vertical, spacing: self.config.verticalSpacing)
        for _ in 0..<3 {
            let horizontalStackView = self.createButtonsStackView(buttonCount: 3)
            stackView.addArrangedSubview(horizontalStackView)
        }
        
        let pointZeroDeleteStackView = self.createDecimalSeparatorAndDeleteAndZeroStackView()
        stackView.addArrangedSubview(pointZeroDeleteStackView)
        
        self.addSubview(stackView)
        let attributes: [NSLayoutConstraint.Attribute] = [.top, .left, .right, .bottom]
        stackView.translatesAutoresizingMaskIntoConstraints = false
        attributes.forEach {
            NSLayoutConstraint(item: stackView, attribute: $0, relatedBy: .equal, toItem: self, attribute: $0, multiplier: 1, constant: 0).isActive = true
        }
    }
    
    //Create butons from 1 to 9
    private func createButtonsStackView(buttonCount: Int) -> UIStackView {
        let stackView = self.createStackView(axis: .horizontal, spacing: self.config.horizontalSpacing)
        for _ in 0..<buttonCount {
            let numButton = self.createRoundButton(title: "\(self.numTag)", tag: self.numTag)
            self.numTag += 1
            stackView.addArrangedSubview(numButton)
        }
        
        return stackView
    }
    
    //Create stack view with options
    private func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }
    
    //Create Decimal separator, delete and zero button
    private func createDecimalSeparatorAndDeleteAndZeroStackView() -> UIStackView {
        let stackView = self.createStackView(axis: .horizontal, spacing: self.config.horizontalSpacing)
        if let decimalseparator = self.config.decimalSeparator {
            stackView.addArrangedSubview(self.createRoundButton(title: decimalseparator, tag: 10))
        } else {
            let spaceButton = self.createRoundButton(title: "", tag: 10)
            spaceButton.isUserInteractionEnabled = false
        }
        
        stackView.addArrangedSubview(self.createRoundButton(title: "0", tag: 0))
        stackView.addArrangedSubview(self.createRoundButton(image: self.config.deleteIcon, tag: 11))
        
        return stackView
    }
    
    //Round button to show with number or other specific symbols
    private func createRoundButton(title: String, tag: Int) -> UIButton {
        let roundButton = self.createHightLightRoundButton()
        roundButton.addTarget(self, action: #selector(roundButtonAction), for: .touchUpInside)
        roundButton.tag = tag
        roundButton.setTitle(title, for: .normal)
        roundButton.setTitleColor(self.config.textColor, for: .normal)
        roundButton.titleLabel?.font = UIFont.systemFont(ofSize: self.config.textSize)
        
        return roundButton
    }
    
    //Round button to show with number or other specific symbols
    private func createRoundButton(image: UIImage?, tag: Int) -> UIButton {
        let roundButton = self.createHightLightRoundButton()
        roundButton.addTarget(self, action: #selector(roundButtonAction), for: .touchUpInside)
        roundButton.tag = tag
        roundButton.setImage(image, for: .normal)
        
        return roundButton
    }
    
    //Highlight round button
    private func createHightLightRoundButton() -> YZHightLightRoundButton {
        let radius = self.config.buttonRadius
        let hightLightRoundButton = YZHightLightRoundButton(backgroundColor: self.config.buttonColor,
                                                 radius: radius,
                                                 borderColor: self.config.borderColor,
                                                 borderWidth: self.config.buttonBorderWidth)
        
        hightLightRoundButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: hightLightRoundButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: radius * 2).isActive = true
        NSLayoutConstraint(item: hightLightRoundButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: radius * 2).isActive = true
        
        return hightLightRoundButton
    }
}

