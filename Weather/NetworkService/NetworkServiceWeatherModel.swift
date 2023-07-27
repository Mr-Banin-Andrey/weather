//
//  NetworkServiceWeatherModel.swift
//  Weather
//
//  Created by Андрей Банин on 27.7.23..
//

import Foundation

struct NetworkServiceWeatherModel: Decodable {
    let now: Int
    let now_dt: String
    
    let lat: Double
    let lon: Double
    let def_pressure_mm: Int
    let def_pressure_pa: Int
    
    let offset: Int
    let name: String
    let abbr: String
    let dst: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case now //Время сервера в формате Unixtime.
        case now_dt //Время сервера в UTC.
        
        case info // ключ вложенного запроса
    }
    
    enum InfoKeys: String, CodingKey {
        case lat //Широта (в градусах).
        case lon //Долгота (в градусах).
        case def_pressure_mm // Норма давления для данной координаты (в мм рт. ст.).
        case def_pressure_pa //Норма давления для данной координаты (в гектопаскалях).
//        case url //Страница населенного пункта на сайте Яндекс.Погода.
        
        case tzinfo // ключ вложенного запроса
    }
    
    enum Tzinfo: String, CodingKey {  // Информация о часовом поясе
        case offset //Часовой пояс в секундах от UTC.
        case name //Часовой пояс в секундах от UTC.
        case abbr // Сокращенное название часового пояса.
        case dst //Признак летнего времени.
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        now = try container.decode(Int.self, forKey: .now)
        now_dt = try container.decode(String.self, forKey: .now_dt)
        
        let infoContainer = try container.nestedContainer(keyedBy: InfoKeys.self, forKey: .info)
        lat = try infoContainer.decode(Double.self, forKey: .lat)
        lon = try infoContainer.decode(Double.self, forKey: .lon)
        def_pressure_mm = try infoContainer.decode(Int.self, forKey: .def_pressure_mm)
        def_pressure_pa = try infoContainer.decode(Int.self, forKey: .def_pressure_pa)
        
        let tzinfo = try infoContainer.nestedContainer(keyedBy: Tzinfo.self, forKey: .tzinfo)
        offset = try tzinfo.decode(Int.self, forKey: .offset)
        name = try tzinfo.decode(String.self, forKey: .name)
        abbr = try tzinfo.decode(String.self, forKey: .abbr)
        dst = try tzinfo.decode(Bool.self, forKey: .dst)

    }
}

    //    let fact: [Fact]
        
    //    struct Fact: Decodable {
    //        let cloudness: Int // Облачность
    //        let condition: String // описание погоды
    //        let daytime: String // Светлое или темное время суток
    //        let feels_like: Int // ощущения температура
    //        let humidity: Int // Влажность воздуха (в процентах).
    ////        let icon: String // картинка погоды, отдельно грузиться
    //        let is_thunder: Bool // Признак грозы.
    //        let obs_time: Int // Время замера погодных данных в формате Unixtime.
    //        let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //        let season: String // Время года в данном населенном пункте.
    //        let temp: Int // температура
    //        let temp_water: Int // темп воды там где она есть
    //        let wind_speed: Int // Скорость ветра (в м/с).
    //        let wind_gust: Int // Скорость порывов ветра (в м/с).
    //        let wind_dir: Int // Направление ветра.
    //        let pressure_mm: Int // Давление (в мм рт. ст.).
    //        let pressure_pa: Int // Давление (в гектопаскалях).
    //        let prec_type: Int // Тип осадков
    //        let prec_strength: Int // Сила осадков.
    //        let phenom_icon: String // Код дополнительной иконки погодного явления.
    //        let phenom_condition: String // Код расшифровки дополнительного погодного описания
    //    }
    //
    ////    let forecasts: [Forecasts]
    //
    //    struct Forecasts: Decodable {
    //        let date: String // Дата прогноза в формате ГГГГ-ММ-ДД.
    //        let date_ts: Int // Дата прогноза в формате Unixtime.
    //        let week: Int // Порядковый номер недели.
    //        let rise_begin: String? // Время начала восхода Солнца, локальное время (может отсутствовать для полярных регионов).
    //        let sunrise: String? // Время окончания восхода Солнца, локальное время (может отсутствовать для полярных регионов).
    //        let sunset: String? // Время начала заката Солнца, локальное время (может отсутствовать для полярных регионов).
    //        let set_end: String? // Время окончания заката Солнца, локальное время (может отсутствовать для полярных регионов).
    //        let moon_code: Int //  Код фазы Луны
    //        let moon_text: String //Текстовый код для фазы Луны.
    //        let parts: [Parts]
    //
    //        struct Parts: Decodable {
    //            let night: [Night]
    //
    //            struct Night: Decodable {
    //                let temp_min: Int // температура мин
    //                let temp_max: Int // температура мах
    //                let temp_avg: Int // температура средняя
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let daytime: String // Светлое или темное время суток
    //                let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //                let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //
    //            let morning: [Morning]
    //
    //            struct Morning: Decodable {
    //                let temp_min: Int // температура мин
    //                let temp_max: Int // температура мах
    //                let temp_avg: Int // температура средняя
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let daytime: String // Светлое или темное время суток
    //                let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //                let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //
    //            let day: [Day]
    //
    //            struct Day: Decodable {
    //                let temp_min: Int // температура мин
    //                let temp_max: Int // температура мах
    //                let temp_avg: Int // температура средняя
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let daytime: String // Светлое или темное время суток
    //                let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //                let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //
    //            let evening: [Evening]
    //
    //            struct Evening: Decodable {
    //                let temp_min: Int // температура мин
    //                let temp_max: Int // температура мах
    //                let temp_avg: Int // температура средняя
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let daytime: String // Светлое или темное время суток
    //                let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //                let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //
    //            let day_short: [Day_short]
    //
    //            struct Day_short: Decodable {
    //                let temp: Int // температура
    //                let temp_min: Int // температура мин
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //
    //            let night_short: [Night_short]
    //
    //            struct Night_short: Decodable {
    //                let temp: Int // температура мин за ночь
    //                let feels_like: Int // ощущения температура
    //                let icon: String // картинка погоды, отдельно грузиться
    //                let condition: String // описание погоды
    //                let wind_speed: Int // Скорость ветра (в м/с).
    //                let wind_gust: Int // Скорость порывов ветра (в м/с).
    //                let wind_dir: Int // Направление ветра.
    //                let pressure_mm: Int // Давление (в мм рт. ст.).
    //                let pressure_pa: Int // Давление (в гектопаскалях).
    //                let humidity: Int // Влажность воздуха (в процентах).
    //                let prec_type: Int // Тип осадков
    //                let prec_strength: Int // Сила осадков.
    //                let cloudness: Int // Облачность
    //            }
    //        }
    //
    //        let temp_min: Int //Минимальная температура для времени суток (°C).
    //        let temp_max: Int // Максимальная температура для времени суток (°C).
    //        let temp_avg: Int // Средняя температура для времени суток (°C).
    //        let feels_like: Int //Ощущаемая температура (°C).
    //        let icon: String // Код иконки погоды.
    //        let condition: String // Код расшифровки погодного описания.
    //        let daytime: String // Светлое или темное время суток
    //        let polar: Bool // Признак того, что время суток, указанное в поле daytime, является полярным.
    //        let wind_speed: Int // Скорость ветра (в м/с).
    //        let wind_gust: Int // Скорость порывов ветра (в м/с).
    //        let wind_dir: Int // Направление ветра.
    //        let pressure_mm: Int // Давление (в мм рт. ст.).
    //        let pressure_pa: Int // Давление (в гектопаскалях).
    //        let humidity: Int // Влажность воздуха (в процентах).
    //        let soil_temp: Int // Температура почвы (°C).
    //        let soil_moisture: Int //Влажность почвы (в процентах).
    //        let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //        let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //        let prec_prob: Int // Вероятность выпадения осадков (в процентах).
    //        let prec_type: Int // Тип осадков
    //        let prec_strength: Int // Сила осадков.
    //        let fresh_snow_mm: Int // Количество свежего снега (в мм). Вычисляется на основе значения поля prec_mm.
    //        let cloudness: Int // Облачность
    //        let uv_index: Int
    //        let temp: Int // Максимальная дневная или минимальная ночная температура (°C).
    //
    //        let hours: [Hours]
    //
    //        struct Hours: Decodable {
    //            let hour: String // Значение часа, для которого дается прогноз (0-23), локальное время.
    //            let hour_ts: Int // Время прогноза в Unixtime.
    //            let temp: Int // Максимальная дневная или минимальная ночная температура (°C).
    //            let feels_like: Int //Ощущаемая температура (°C).
    //            let icon: String // Код иконки погоды.
    //            let condition: String // Код расшифровки погодного описания.
    //            let wind_speed: Int // Скорость ветра (в м/с).
    //            let wind_gust: Int // Скорость порывов ветра (в м/с).
    //            let wind_dir: Int // Направление ветра.
    //            let pressure_mm: Int // Давление (в мм рт. ст.).
    //            let pressure_pa: Int // Давление (в гектопаскалях).
    //            let humidity: Int // Влажность воздуха (в процентах).
    //            let prec_mm: Int // Прогнозируемое количество осадков (в мм).
    //            let prec_period: Int // Прогнозируемый период осадков (в минутах).
    //            let prec_type: Int // Тип осадков
    //            let prec_strength: Int // Сила осадков.
    //            let is_thunder: Bool // Признак грозы.
    //            let cloudness: Int // Облачность
    //        }
    //
    //        let hour: String // Значение часа, для которого дается прогноз (0-23), локальное время.
    //        let hour_ts: Int // Время прогноза в Unixtime.
    //    }
