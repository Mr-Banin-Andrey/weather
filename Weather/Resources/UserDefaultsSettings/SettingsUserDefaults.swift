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
    
    func addValue(key: Keys, value: SettingsUserDefaultsModel) {
        do {
            let data = try JSONEncoder().encode(value)
            userDefaults.set(data, forKey: key.rawValue)
        } catch let error {
            print(error)
        }
    }
    
    func getValue(key: Keys) -> SettingsUserDefaultsModel {
        if let data = userDefaults.data(forKey: key.rawValue) {
            do {
                let value = try JSONDecoder().decode(SettingsUserDefaultsModel.self, from: data)
                return value
            } catch let error {
                print(error)
            }
        }
        return SettingsUserDefaultsModel(indexSelected: 99, value: "")
    }
}
