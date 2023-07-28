
import Foundation
import Alamofire

class NetworkServiceWeather {
    
    func loadWeather() {
        
        let token = "4a008062-0c53-450d-a584-132047fd7220"
        
        guard let url = urlComponents().url else { return }
        
        AF.request(url,
                   method: .get,
                   headers: [
                    "lat" : "55.75396",
                    "lon" : "37.620393",
                    "lang" : "ru_RU",
                    "limit" : "7",
                    "hours" : "true",
                    "extra" : "false",
                    "X-Yandex-API-Key" : token
                   ])
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                print(value)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func urlComponents() -> URLComponents {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.weather.yandex.ru"
        urlComponents.path = "/v2/forecast"
        return urlComponents
    }
}
//class ApiManager {
//   let  url = "https://15f1-61-246-140-18.in.ngrok.io/Legal251AppAPI_IOS/api/lgapp/index.php?parameter=sendotp"
//   static let sharedInstance = ApiManager()
//
//    func callingApi<Input: Encodable, Output: Decodable>(signUp : Input, type: Output.Type) {
//        let headers: HTTPHeaders = [
////            "Authkey":
//        ]
//        AF.request(url, method: .post,
//                  parameters: signUp,
//                  encoder: JSONParameterEncoder.default,
//                  headers: headers).responseDecodable(of: Output.self, decoder: JSONDecoder()) { response in
//                     switch response.result {
//                         case .success(let result): print(result)
//                         case .failure(let error): print(error)
//                     }
//        }
//    }
//}
