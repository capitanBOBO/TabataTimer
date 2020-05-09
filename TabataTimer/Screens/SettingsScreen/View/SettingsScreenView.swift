//
//  SettingsScreenView.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

protocol SettingsScreenViewDelegate : class {
    func toggleMusicControlSwitch()
    func valueWasChanged(increase: Bool, type: SettingsScreenView.FieldType)
}

class SettingsScreenView : UIView {
    
    enum FieldType : Int, CaseIterable {
        case preperation
        case exercise
        case rest
        case duration
        
        var title: String {
            switch self {
            case .preperation:
                return "Preparation"
            case .exercise:
                return "Exercise"
            case .rest:
                return "Rest"
            case .duration:
                return "Duration"
            }
        }
        
        var unit: String {
            switch self {
            case .duration:
                return "set"
            default:
                return "sec"
            }
        }
    }
    
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
        v.onTintColor = .defaultButtonCollor
        v.isOn = true
        v.addTarget(self, action: #selector(toggleSwitchState), for: .touchUpInside)
        return v
    }()
    
    lazy var settingsFieldStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .vertical
        v.spacing = 15
        return v
    }()
    
    lazy var preparationTimeSettingsField: SettingsFieldView = prepareSettingsField(type: .preperation)
    
    lazy var exerciseTimeSettingsField: SettingsFieldView = prepareSettingsField(type: .exercise)
    
    lazy var restTimeSettingsField: SettingsFieldView = prepareSettingsField(type: .rest)
    
    lazy var durationTimeSettingsField: SettingsFieldView = prepareSettingsField(type: .duration)
    
    weak var delegate: SettingsScreenViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setValue(_ value: Int, forField type: FieldType) {
        guard settingsFieldStackView.arrangedSubviews.indices.contains(type.rawValue),
            let view = settingsFieldStackView.arrangedSubviews[type.rawValue] as? SettingsFieldView else { return }
        view.valueLabel.text = "\(value)"
        if type == .duration {
            view.unitLabel.text = value > 1 ? "sets" : "set"
        }
    }
    
}

//MARK: Action

extension SettingsScreenView {
    @objc private func toggleSwitchState() {
        delegate?.toggleMusicControlSwitch()
    }
}

//MARK: Private

extension SettingsScreenView {
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
        musicControlLabel.setAnchors(top: settingsFieldStackView.bottomAnchor, topPadding: 25, leading: leadingAnchor, leadingPadding: 20)
        musicControlShowSwitch.setAnchors(trailing: trailingAnchor, trailingPadding: 20)
        musicControlShowSwitch.setCenterAnchor(centerY: musicControlLabel.centerYAnchor)
    }
    
    private func prepareSettingsField(type: FieldType) -> SettingsFieldView {
        let v = SettingsFieldView()
        v.titleLabel.text = type.title
        v.unitLabel.text = type.unit
        v.increaseBlock = { [weak self] (view) in
            self?.delegate?.valueWasChanged(increase: true, type: type)
        }
        v.decreaseBlock = { [weak self] (view) in
            self?.delegate?.valueWasChanged(increase: false, type: type)
        }
        return v
    }
}
