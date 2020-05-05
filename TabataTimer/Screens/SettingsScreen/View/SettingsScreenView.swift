//
//  SettingsScreenView.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class SettingsScreenView : UIView {
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.text = "Settings"
        v.font = .systemFont(ofSize: 28, weight: .bold)
        v.textAlignment = .center
        return v
    }()
    
    lazy var subtitleLabel: UILabel = {
        let v = UILabel()
        v.text = "Workout time"
        v.font = .systemFont(ofSize: 16, weight: .medium)
        v.textAlignment = .center
        v.textColor = .tertiaryLabel
        return v
    }()
    
    lazy var musicControlLabel: UILabel = {
        let v = UILabel()
        v.text = "Show music controls"
        return v
    }()
    
    lazy var musicControlShowSwitch: UISwitch = {
       let v = UISwitch()
        v.onTintColor = .systemBlue
        v.isOn = true
        return v
    }()
    
    lazy var settingsFieldStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.spacing = 15
        return v
    }()
    
    lazy var preparationTimeSettingsField: SettingsFieldView = {
           let v = SettingsFieldView()
           v.titleLabel.text = "Preparation"
           v.unitLabel.text = "sec"
           v.valueLabel.text = "30"
           return v
       }()
    
    lazy var exerciseTimeSettingsField: SettingsFieldView = {
        let v = SettingsFieldView()
        v.titleLabel.text = "Excercise"
        v.unitLabel.text = "sec"
        v.valueLabel.text = "30"
        return v
    }()
    
    lazy var restTimeSettingsField: SettingsFieldView = {
        let v = SettingsFieldView()
        v.titleLabel.text = "Rest"
        v.unitLabel.text = "sec"
        v.valueLabel.text = "15"
        return v
    }()
    
    lazy var durationTimeSettingsField: SettingsFieldView = {
        let v = SettingsFieldView()
        v.titleLabel.text = "Excercise"
        v.unitLabel.text = "sets"
        v.valueLabel.text = "5"
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
        backgroundColor = .tertiarySystemBackground
        addSubviews(titleLabel, subtitleLabel, settingsFieldStackView, musicControlLabel, musicControlShowSwitch)
        titleLabel.setAnchors(top: topAnchor, topPadding: 20)
        titleLabel.setCenterAnchor(centerX: centerXAnchor)
        subtitleLabel.setAnchors(top: titleLabel.bottomAnchor, topPadding: 5)
        subtitleLabel.setCenterAnchor(centerX: centerXAnchor)
        settingsFieldStackView.setAnchors(top: subtitleLabel.bottomAnchor, topPadding: 20, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20)
        settingsFieldStackView.addArrangedSubview(preparationTimeSettingsField)
        settingsFieldStackView.addArrangedSubview(exerciseTimeSettingsField)
        settingsFieldStackView.addArrangedSubview(restTimeSettingsField)
        settingsFieldStackView.addArrangedSubview(durationTimeSettingsField)
//        exerciseTimeSettingsField.setAnchors(top: subtitleLabel.bottomAnchor, topPadding: 20, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20)
//        restTimeSettingsField.setAnchors(top: exerciseTimeSettingsField.bottomAnchor, topPadding: 15, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20)
//        durationTimeSettingsField.setAnchors(top: restTimeSettingsField.bottomAnchor, topPadding: 15, leading: leadingAnchor, leadingPadding: 20, trailing: trailingAnchor, trailingPadding: 20)
        musicControlLabel.setAnchors(top: settingsFieldStackView.bottomAnchor, topPadding: 25, leading: leadingAnchor, leadingPadding: 20)
        musicControlShowSwitch.setAnchors(trailing: trailingAnchor, trailingPadding: 20)
        musicControlShowSwitch.setCenterAnchor(centerY: musicControlLabel.centerYAnchor)
    }
}
