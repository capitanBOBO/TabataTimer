//
//  SettingsFieldView.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class SettingsFieldView : UIView {
    
    var increaseBlock:((SettingsFieldView)->())?
    var decreaseBlock:((SettingsFieldView)->())?
    
    lazy var minusButton: UIButton = {
        let v: UIButton = UIButton().rounded(22.5).bordered(2, color: .defaultButtonCollor)
        v.setImage(UIImage(systemName: "minus"), for: .normal)
        v.tintColor = .defaultButtonCollor
        return v
    }()
    
    lazy var plusButton: UIButton = {
        let v: UIButton = UIButton().rounded(22.5).bordered(2, color: .defaultButtonCollor)
        v.setImage(UIImage(systemName: "plus"), for: .normal)
        v.tintColor = .defaultButtonCollor
        return v
    }()
    
    lazy var titleLabel = UILabel()
    
    lazy var unitLabel: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 34, weight: .bold)
        v.textAlignment = .left
        return v
    }()
    
    lazy var valueLabel: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 34, weight: .bold)
        v.textAlignment = .right
        v.text = "0"
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func customInit() {
        backgroundColor = .clear
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.addSubviews(valueLabel, unitLabel)
        let separatorView = UIView()
        separatorView.backgroundColor = .defaultButtonCollor
        addSubviews(containerView, minusButton, plusButton, titleLabel, separatorView)
        valueLabel.setAnchors(top:containerView.topAnchor, bottom: containerView.bottomAnchor, leading: containerView.leadingAnchor)
        unitLabel.setAnchors(top: containerView.topAnchor, bottom: containerView.bottomAnchor, leading: valueLabel.trailingAnchor, leadingPadding: 5, trailing: containerView.trailingAnchor)
        separatorView.setAnchors(bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, heightConstant: 1)
        minusButton.setAnchors(bottom: separatorView.topAnchor, bottomPadding: 15, leading: leadingAnchor, widthConstant: 45, heightConstant: 45)
        plusButton.setAnchors(bottom: separatorView.topAnchor, bottomPadding: 15, trailing: trailingAnchor, widthConstant: 45, heightConstant: 45)
        containerView.setCenterAnchor(centerX: centerXAnchor, centerY: minusButton.centerYAnchor)
        titleLabel.setAnchors(top: topAnchor, bottom: minusButton.topAnchor, bottomPadding: 10)
        titleLabel.setCenterAnchor(centerX: centerXAnchor)
        minusButton.addTarget(self, action: #selector(decreaseValue), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(increaseValue), for: .touchUpInside)
    }
    
    @objc private func increaseValue() {
        increaseBlock?(self)
    }
    
    @objc private func decreaseValue() {
        decreaseBlock?(self)
    }
}
