//
//  SettingsScreenViewController.swift
//  TabataTimer
//
//  Created by Иван Савин on 05.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import UIKit

class SettingsScreenViewController : UIViewController {
    
    lazy var thisView = SettingsScreenView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(thisView)
        thisView.fillInSuperview()
        thisView.delegate = self
        prepareView()
    }
    
}

//MARK: Private

extension SettingsScreenViewController {
    private func prepareView() {
        thisView.musicControlShowSwitch.isOn = SettingsManager.showControlMusic.getValue()!
        thisView.setValue(SettingsManager.preparationSec.getValue()!, forField: .preperation)
        thisView.setValue(SettingsManager.exerciseSec.getValue()!, forField: .exercise)
        thisView.setValue(SettingsManager.restSec.getValue()!, forField: .rest)
        thisView.setValue(SettingsManager.durationSets.getValue()!, forField: .duration)
    }
}

//MARK: SettingsScreenView delegate

extension SettingsScreenViewController : SettingsScreenViewDelegate {
    func toggleMusicControlSwitch() {
        let value = SettingsManager.showControlMusic.getValue()!
        SettingsManager.showControlMusic.setValue(!value)
        prepareView()
    }
    
    func valueWasChanged(increase: Bool, type: SettingsScreenView.FieldType) {
        var attribute : SettingsAttribute<Int>
        switch type {
        case .preperation:
            attribute = SettingsManager.preparationSec
        case .exercise:
            attribute = SettingsManager.exerciseSec
        case .rest:
            attribute = SettingsManager.restSec
        default:
            attribute = SettingsManager.durationSets
        }
        let value = attribute.getValue()!
        attribute.setValue(increase ? value + 1 : value - 1)
        prepareView()
    }
}
