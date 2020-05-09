//
//  SettingsManager.swift
//  TabataTimer
//
//  Created by Иван Савин on 06.05.2020.
//  Copyright © 2020 Иван Савин. All rights reserved.
//

import Foundation

struct SettingsManager {
    static let showControlMusic = SettingsAttribute<Bool>(key: "showControlMusic", defaultValue: false)
    static let preparationSec = SettingsAttribute<Int>(key: "preparation", defaultValue: 10)
    static let exerciseSec = SettingsAttribute<Int>(key: "exercise", defaultValue: 30)
    static let restSec = SettingsAttribute<Int>(key: "rest", defaultValue: 15)
    static let durationSets = SettingsAttribute<Int>(key: "duration", defaultValue: 1)
}

struct SettingsAttribute<T> {
    
    private(set) var key: String!
    private(set) var defaultValue: T?
    
    func getValue() -> T? {
        return UserDefaults.standard.value(forKey: key) as? T ?? defaultValue
    }
    
    func setValue(_ value: T) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
}
