
import Foundation
import Alamofire

class NetworkServiceWeather: NSObject{
    
    var parameters = Parameters()
    var headers = HTTPHeaders()
    var method: HTTPMethod!
    var url: String = "https://api.weather.yandex.ru/v2/forecast"
    var encoding: ParameterEncoding = JSONEncoding.default

    init(
        data: [String:Any],
        headers: [String:String] = [:],
        url :String,
        method: HTTPMethod = .post,
        isJSONRequest: Bool = true
    ){
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

//        DispatchQueue.main.async {
//            let urlYan = "https://api.weather.yandex.ru/v2/forecast"
//
//            let headers = [
//                "X-Yandex-API-Key":"4a008062-0c53-450d-a584-132047fd7220"
//            ]
//            NetworkServiceWeather(
//                data: [
//                    "lat":"55.75198",
//                    "lon":"37.604860",
//                    "lang":"ru_RU",
//                    "limit":"7",
//                    "hours":"true",
//                    "extra":"false"
//                ],
//                headers: headers,
//                url: urlYan,
//                method: .get,
//                isJSONRequest: false
//            ).executeQuery() { (result: Result<NetworkServiceWeatherModel,Error>) in
//                switch result {
//                case .success(let weather):
//                    print("✅", weather)
//                case .failure(let error):
//                    print("🔞", error)
//                }
//            }
//        }
