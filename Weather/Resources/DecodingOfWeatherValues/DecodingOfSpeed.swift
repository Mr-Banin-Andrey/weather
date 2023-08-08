
import Foundation

class DecodingOfSpeed {
    
    static let shared = DecodingOfSpeed()
    
    private init() {}
    
    func toMsOrKmH(ms: Double) -> String{

//        return "\(String(ms * 3.6)) км/ч"
        return "\(String(ms)) м/с"
    }
}
