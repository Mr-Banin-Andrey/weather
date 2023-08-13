
import Foundation

class DecodingOfSpeed {
    
    func toMsOrKmH(ms: Double, mph: String) -> String{
        if mph == "Mi" {
            let mi = ms * 2.236936
            return "\(String(format: "%.1f", mi)) mph"
        } else {
            return "\(String(ms)) м/с"
        }
    }
}
