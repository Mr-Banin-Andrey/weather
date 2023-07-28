
import Foundation

struct NetworkServiceWeatherModel: Decodable {
    
    let now: Int // Время сервера в формате Unixtime.
    let now_dt: String // Время сервера в UTC.
    let info: Info
    let fact: Fact
    let forecasts: [Forecasts]

    enum CodingKeys: String, CodingKey {
        case now
        case now_dt
        case info // ключ вложенного запроса
        case fact // ключ вложенного запроса
        case forecasts // ключ вложенного запроса
    }
}

struct Info: Decodable {
    let lat: Double //Широта (в градусах).
    let lon: Double //Долгота (в градусах).
    let tzinfo: Tzinfo
}

struct Tzinfo: Decodable {
    let offset: Int // Часовой пояс в секундах от UTC.
    let name: String // Название часового пояса.
    let abbr: String // Сокращенное название часового пояса.
    let dst: Bool // Признак летнего времени.
}

struct Fact: Decodable {
    let temp: Int // температура
    let wind_speed: Double // Скорость ветра (в м/с).
    let wind_dir: String // Направление ветра.
    let uv_index: Int // uv index
    let condition: String // описание погоды
    let prec_strength: Int // Сила осадков.
    let feels_like: Int // ощущения температура
    let cloudness: Int // Облачность
    let is_thunder: Bool // Признак грозы.
}

struct Forecasts: Decodable {
    let date: String // Дата прогноза в формате ГГГГ-ММ-ДД.
    let date_ts: Int // Дата прогноза в формате Unixtime.
    let rise_begin: String? // Время начала восхода Солнца, локальное время (может отсутствовать для полярных регионов).
    let set_end: String? // Время окончания заката Солнца, локальное время (может отсутствовать для полярных регионов).
    let moon_code: Int //  Код фазы Луны : 0 - полнолуние, 1-3 убывающая Луна и т.д.
    let moon_text: String //Текстовый код для фазы Луны: полнолуние,  убывающая луна.
    let parts: Parts
    let hours: [Hours]
}

struct Parts: Decodable {
    let night: Night
    let morning: Morning
    let day: DayWeather
    let evening: Evening
    let day_short: DayShort
    let night_short: NightShort
}

struct Night: Decodable {
    let cloudness: Double // Облачность
    let condition: String // описание погоды
    let feels_like: Int // ощущения температура
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let temp_avg: Int // температура средняя
    let temp_max: Int // температура мах
    let temp_min: Int // температура мин
    let uv_index: Int?
    let wind_dir: String? // Направление ветра.
    let wind_speed: Double? // Скорость ветра (в м/с).
}

struct Morning: Decodable {
    let cloudness: Double // Облачность
    let condition: String // описание погоды
    let feels_like: Int // ощущения температура
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let temp_avg: Int // температура средняя
    let temp_max: Int // температура мах
    let temp_min: Int // температура мин
    let uv_index: Int?
    let wind_dir: String? // Направление ветра.
    let wind_speed: Double? // Скорость ветра (в м/с).
}

struct DayWeather: Decodable {
    let cloudness: Double // Облачность
    let condition: String // описание погоды
    let feels_like: Int // ощущения температура
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let temp_avg: Int // температура средняя
    let temp_max: Int // температура мах
    let temp_min: Int // температура мин
    let uv_index: Int?
    let wind_dir: String? // Направление ветра.
    let wind_speed: Double? // Скорость ветра (в м/с).
}

struct Evening: Decodable {
    let cloudness: Double // Облачность
    let condition: String // описание погоды
    let feels_like: Int // ощущения температура
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let temp_avg: Int // температура средняя
    let temp_max: Int // температура мах
    let temp_min: Int // температура мин
    let uv_index: Int?
    let wind_dir: String? // Направление ветра.
    let wind_speed: Double? // Скорость ветра (в м/с).
}

struct DayShort: Decodable {
    let temp: Int // температура
    let temp_min: Int // температура мин
    let feels_like: Int // ощущения температура
    let condition: String // описание погоды
    let wind_speed: Double? // Скорость ветра (в м/с).
    let wind_dir: String? // Направление ветра.
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let cloudness: Double // Облачность
}

struct NightShort: Decodable {
    let temp: Int // температура мин за ночь
    let feels_like: Int // ощущения температура
    let condition: String // описание погоды
    let wind_speed: Double? // Скорость ветра (в м/с).
    let wind_dir: String? // Направление ветра.
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let cloudness: Double // Облачность
}

struct Hours: Decodable {
    let hour: String // Значение часа, для которого дается прогноз (0-23), локальное время.
    let hour_ts: Int // Время прогноза в Unixtime.
    let temp: Int // Максимальная дневная или минимальная ночная температура (°C).
    let feels_like: Int //Ощущаемая температура (°C).
    let condition: String // Код расшифровки погодного описания.
    let prec_type: Double // Тип осадков
    let prec_strength: Double // Сила осадков.
    let is_thunder: Bool // Признак грозы.
    let cloudness: Double // Облачностm
    let wind_speed: Double? // Скорость ветра (в м/с).
    let wind_dir: String? // Направление ветра.
}
