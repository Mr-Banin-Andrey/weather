
import Foundation
import Alamofire

class NetworkService: NSObject{
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url: String
    var encoding: ParameterEncoding = JSONEncoding.default

    init(
        data: [String:Any],
        headers: [String:String] = [:],
        url :String,
        method: HTTPMethod = .get,
        isJSONRequest: Bool = true
    ){
        self.url = url
        super.init()
        
        data.forEach{parameters.updateValue($0.value, forKey: $0.key)}
        headers.forEach({self.headers.add(name: $0.key, value: $0.value)})
        
        if !isJSONRequest{
            encoding = URLEncoding.default
        }
        self.method = method
    }

    func executeQuery<T>(completion: @escaping (Result<T, Error>) -> Void) where T: Codable {
        AF.request(
            url,
            method: method,
            parameters: parameters,
            encoding: encoding,
            headers: headers
        ).responseData(completionHandler: { response in
            
            switch response.result{
            case .success(let res):
                if let code = response.response?.statusCode{
                    switch code {
                    case 200...299:
                        do {
                            completion(.success(try JSONDecoder().decode(T.self, from: res)))
                        } catch let error {
                            print(String(data: res, encoding: .utf8) ?? "nothing received")
                            completion(.failure(error))
                        }
                    default:
                     let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}


//DispatchQueue.main.async {
//NetworkCall(
//    data: headGeo(city: "Барселона"),
//    headers: [:], //headGeo(city: "minsk"),
//    url: urlGeo,
//    method: .get,
//    isJSONRequest: false
//).executeQuery() { (result: Result<ResponseCode,Error>) in
//    switch result {
//    case .success(let weather):
//        let latLon = self.latLon(point: weather.response.geoObjectCollection.featureMember[0].geoObject.point.pos)
//        let lat = latLon.0
//        let lon = latLon.1
//        print("✅", weather.response.geoObjectCollection.featureMember[0].geoObject)
//
//
//        NetworkCall(
//            data: ["lat":lat,
//                   "lon":lon,
//                   "lang":"ru_RU",
//                   "limit":"7",
//                   "hours":"true",
//                   "extra":"false"] ,
//            headers: self.headers,
//            url: self.urlYan,
//            method: .get,
//            isJSONRequest: false
//        ).executeQuery() { (result: Result<WeatherModel,Error>) in
//            switch result {
//            case .success(let weather):
//                print("🅿️", weather)
//            case .failure(let error):
//                print("❌", error)
//            }
//        }
//    case .failure(let error):
//        print("🔞", error)
//    }
//}
//                }

//private func latLon(point: String) -> (String, String) {
//    let myStringArr = point.components(separatedBy: " ")
//    let lon = myStringArr[0]
//    let lat = myStringArr[1]
//    print("🟣", lat, lon)
//    return (lat, lon)
//}

//let urlYan = "https://api.weather.yandex.ru/v2/forecast"
//let headers = ["X-Yandex-API-Key":"4a008062-0c53-450d-a584-132047fd7220"]
//
//let urlGeo = "https://geocode-maps.yandex.ru/1.x"
//func headGeo(city: String) -> [String:String] {
//    let headersGeo = [
//        "apikey":"653bb56c-4ee4-4a72-99cc-9e645a1f5872",
//        "geocode":city,
//        "lang":"ru_RU",
//        "format":"json"
//    ]
//    print(headersGeo)
//    return headersGeo
//}
