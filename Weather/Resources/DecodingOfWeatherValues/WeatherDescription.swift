
import Foundation

class WeatherDescription {
   public let condition = [
        "clear":"ясно",
        "partly-cloudy":"малооблачно",
        "cloudy":"облачно с прояснениями",
        "overcast":"пасмурно",
        "light-rain":"небольшой дождь",
        "rain":"дождь",
        "heavy-rain":"сильный дождь",
        "showers":"ливень",
        "wet-snow":"дождь со снегом",
        "light-snow":"небольшой снег",
        "snow":"снег",
        "snow-showers":"снегопад",
        "hail":"град",
        "thunderstorm":"гроза",
        "thunderstorm-with-rain":"дождь с грозой",
        "thunderstorm-with-hail":"гроза с градом"
    ]
    
    public let windDir = [
        "nw":"сз",
        "n":"с",
        "ne":"св",
        "e":"в",
        "se":"юв",
        "s":"ю",
        "sw":"юз",
        "w":"з",
        "c":"ш"
    ]
    
    public let precipitationOrCloudness = [
        0.0:"0%",
        0.25:"25%",
        0.5:"50%",
        0.75:"75%",
        1.0:"100%"
    ]
}
