
import Foundation

class DecodingOfSpeed {
    
    static let shared = DecodingOfSpeed()
    
    private init() {}
    
    func toMsOrKmH(ms: Double) -> String{

//        return "\(String(ms * 3.6)) km/h"
        return "\(String(ms)) m/s"
    }
}
