

import Foundation
import RealmSwift

class NameCityAndWeatherRealmModel: Object {
    
    @Persisted var city: String?
    @Persisted var weather: WeatherModelRealm?
    
    convenience init(city: String, weather: WeatherModelRealm) {
        self.init()
        self.city = city
        self.weather = weather
    }
}

class WeatherModelRealm: Object {
    @Persisted var now: Int?
    @Persisted var now_dt: String?
    @Persisted var info: InfoModelRealm?
    @Persisted var fact: FactModelRealm?
    @Persisted var forecasts: List<ForecastsModelRealm>
    
    convenience init(now: Int, now_dt: String, info: InfoModelRealm, fact: FactModelRealm, forecasts: [ForecastsModelRealm]) {
        self.init()
        self.now = now
        self.now_dt = now_dt
        self.info = info
        self.fact = fact
        self.forecasts.append(objectsIn: forecasts)
    }
}

class InfoModelRealm: Object {
    @Persisted var lat: Double?
    @Persisted var lon: Double?
    @Persisted var tzinfo: TzinfoModelRealm?
    
    convenience init(lat: Double, lon: Double, tzinfo: TzinfoModelRealm) {
        self.init()
        self.lat = lat
        self.lon = lon
        self.tzinfo = tzinfo
    }
}

class TzinfoModelRealm: Object {
    @Persisted var offset: Int?
    @Persisted var name: String?
    @Persisted var abbr: String?
    @Persisted var dst: Bool?
    
    convenience init(offset: Int, name: String, abbr: String, dst: Bool) {
        self.init()
        self.offset = offset
        self.name = name
        self.abbr = abbr
        self.dst = dst
    }
}

class FactModelRealm: Object {
    @Persisted var temp: Int? // температура
    @Persisted var wind_speed: Double? // Скорость ветра (в м/с).
    @Persisted var wind_dir: String? // Направление ветра.
    @Persisted var uv_index: Int? // uv index
    @Persisted var condition: String? // описание погоды
    @Persisted var prec_strength: Double? // Сила осадков.
    @Persisted var feels_like: Int? // ощущения температура
    @Persisted var cloudness: Double? // Облачность
    @Persisted var is_thunder: Bool? // Признак грозы.
    
    convenience init(
        temp: Int,
        wind_speed: Double,
        wind_dir: String,
        uv_index: Int,
        condition: String,
        prec_strength: Double,
        feels_like: Int,
        cloudness: Double,
        is_thunder: Bool
    ) {
        self.init()
        self.temp = temp
        self.wind_speed = wind_speed
        self.wind_dir = wind_dir
        self.uv_index = uv_index
        self.condition = condition
        self.prec_strength = prec_strength
        self.feels_like = feels_like
        self.cloudness = cloudness
        self.is_thunder = is_thunder
    }
}

class ForecastsModelRealm: Object {
    @Persisted var date: String? // Дата прогноза в формате ГГГГ-ММ-ДД.
    @Persisted var date_ts: Int? // Дата прогноза в формате Unixtime.
    @Persisted var rise_begin: String? // Время начала восхода Солнца, локальное время (может отсутствовать для полярных регионов).
    @Persisted var set_end: String? // Время окончания заката Солнца, локальное время (может отсутствовать для полярных регионов).
    @Persisted var moon_code: Int? //  Код фазы Луны : 0 - полнолуние, 1-3 убывающая Луна и т.д.
    @Persisted var moon_text: String? //Текстовый код для фазы Луны: полнолуние,  убывающая луна.
    @Persisted var parts: PartsModelRealm?
    @Persisted var hours: List<HoursModelRealm>
    
    convenience init(
        date: String,
        date_ts: Int,
        rise_begin: String,
        set_end: String,
        moon_code: Int,
        moon_text: String,
        parts: PartsModelRealm,
        hours: [HoursModelRealm]
    ) {
        self.init()
        self.date = date
        self.date_ts = date_ts
        self.rise_begin = rise_begin
        self.set_end = set_end
        self.moon_code = moon_code
        self.moon_text = moon_text
        self.parts = parts
        self.hours.append(objectsIn: hours)
    }
}

class PartsModelRealm: Object {
    @Persisted var night: NightModelRealm?
    @Persisted var morning: MorningModelRealm?
    @Persisted var day: DayWeatherModelRealm?
    @Persisted var evening: EveningModelRealm?
    @Persisted var day_short: DayShortModelRealm?
    @Persisted var night_short: NightShortModelRealm?
    
    convenience init(
        night: NightModelRealm,
        morning: MorningModelRealm,
        day: DayWeatherModelRealm,
        evening: EveningModelRealm,
        day_short: DayShortModelRealm,
        night_short: NightShortModelRealm
    ) {
        self.init()
        self.night = night
        self.morning = morning
        self.day = day
        self.evening = evening
        self.day_short = day_short
        self.night_short = night_short
    }
}

class NightModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp_avg: Int?
    @Persisted var temp_max: Int?
    @Persisted var temp_min: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp_avg: Int,
        temp_max: Int,
        temp_min: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp_avg = temp_avg
        self.temp_max = temp_max
        self.temp_min = temp_min
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class MorningModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp_avg: Int?
    @Persisted var temp_max: Int?
    @Persisted var temp_min: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp_avg: Int,
        temp_max: Int,
        temp_min: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp_avg = temp_avg
        self.temp_max = temp_max
        self.temp_min = temp_min
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class DayWeatherModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp_avg: Int?
    @Persisted var temp_max: Int?
    @Persisted var temp_min: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp_avg: Int,
        temp_max: Int,
        temp_min: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp_avg = temp_avg
        self.temp_max = temp_max
        self.temp_min = temp_min
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class EveningModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp_avg: Int?
    @Persisted var temp_max: Int?
    @Persisted var temp_min: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp_avg: Int,
        temp_max: Int,
        temp_min: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp_avg = temp_avg
        self.temp_max = temp_max
        self.temp_min = temp_min
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class DayShortModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp: Int?
    @Persisted var temp_min: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp: Int,
        temp_min: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp = temp
        self.temp_min = temp_min
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class NightShortModelRealm: Object {
    @Persisted var cloudness: Double?
    @Persisted var condition: String?
    @Persisted var feels_like: Int?
    @Persisted var prec_type: Double?
    @Persisted var prec_strength: Double?
    @Persisted var temp: Int?
    @Persisted var uv_index: Int?
    @Persisted var wind_dir: String?
    @Persisted var wind_speed: Double?
    
    convenience init(
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp: Int,
        uv_index: Int,
        wind_dir: String,
        wind_speed: Double
    ) {
        self.init()
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp = temp
        self.uv_index = uv_index
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
    }
}

class HoursModelRealm: Object {
    @Persisted var hour: String? // Значение часа, для которого дается прогноз (0-23), локальное время.
    @Persisted var hour_ts: Int? // Время прогноза в Unixtime.
    @Persisted var cloudness: Double? // Облачность
    @Persisted var condition: String? // Код расшифровки погодного описания.
    @Persisted var feels_like: Int? //Ощущаемая температура (°C).
    @Persisted var prec_type: Double? // Тип осадков
    @Persisted var prec_strength: Double? // Сила осадков.
    @Persisted var temp: Int? // Максимальная дневная или минимальная ночная температура (°C).
    @Persisted var wind_dir: String? // Направление ветра.
    @Persisted var wind_speed: Double? // Скорость ветра (в м/с).
    @Persisted var is_thunder: Bool? // Признак грозы.
    
    convenience init(
        hour: String,
        hour_ts: Int,
        cloudness: Double,
        condition: String,
        feels_like: Int,
        prec_type: Double,
        prec_strength: Double,
        temp: Int,
        wind_dir: String,
        wind_speed: Double,
        is_thunder: Bool
    ) {
        self.init()
        self.hour = hour
        self.hour_ts = hour_ts
        self.cloudness = cloudness
        self.condition = condition
        self.feels_like = feels_like
        self.prec_type = prec_type
        self.prec_strength = prec_strength
        self.temp = temp
        self.wind_dir = wind_dir
        self.wind_speed = wind_speed
        self.is_thunder = is_thunder
    }
}
