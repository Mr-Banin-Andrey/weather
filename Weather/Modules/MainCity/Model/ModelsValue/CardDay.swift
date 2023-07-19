//
//  CardDay.swift
//  Weather
//
//  Created by Андрей Банин on 19.7.23..
//

import Foundation

struct CardDay {
    var cardDay: [CardOfTheDayModel] = [
        CardOfTheDayModel(tempNow: "45",
                          tempMinMax: "28°/50°",
                          descriptionWeather: "Безоблачно",
                          uvIndex: 10,
                          windSpeed: 1,
                          precipitation: 0,
                          sunriseTime: "06:00",
                          sunsetTime: "19:00"),
        CardOfTheDayModel(tempNow: "15°",
                          tempMinMax: "5°/17°",
                          descriptionWeather: "Возможен небольшой дождь",
                          uvIndex: 2,
                          windSpeed: 4,
                          precipitation: 50,
                          sunriseTime: "04:00",
                          sunsetTime: "21:00"),
    ]
}
