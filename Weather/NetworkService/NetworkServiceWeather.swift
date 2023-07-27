
import Foundation
import Alamofire

class NetworkServiceWeather {
    
    func loadWeather(url: URL) {
        
        //X-Yandex-API-Key: <значение ключа>
        let token = "7af1f1ca-8964-40f5-8570-7abc1ba95755"
        
//        GET https://api.weather.yandex.ru/v2/forecast? lat=55.75396&lon=37.620393&lang=ru_RU&limit=7&hours=true&extra=true&X-Yandex-API-Key=7af1f1ca-8964-40f5-8570-7abc1ba95755
//         lat=<широта>
//         & lon=<долгота>
//         & [lang=<"ru_RU">]
//         & [limit=<7>]
//         & [hours=<true>]
//         & [extra=<true>]
//        X-Yandex-API-Key: <значение ключа>
        
        AF.request(url).response { response in
            debugPrint(response)
//            debugPrint(response.result)
//            print(response.debugDescription)
//            print(response.result)
//            print(response)
        }
    }
}
