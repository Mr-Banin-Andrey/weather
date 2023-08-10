//
//  SettingsUserDefaults.swift
//  Weather
//
//  Created by Андрей Банин on 10.8.23..
//

import Foundation



class SettingsUserDefaults {
    enum Keys: String {
        case temperature //= "temperatureKey"
        case windSpeed //= "windSpeedKey"
        case timeFormat //= "timeFormatKey"
    }
    
    private let userDefaults = UserDefaults.standard
    
    func getValue(key: Keys) -> String {
        if let value = userDefaults.string(forKey: key.rawValue) {
            return value
        }
        return ""
    }
    
    func addValue(key: Keys, value: String) {
        userDefaults.set(value, forKey: key.rawValue)
    }
}
