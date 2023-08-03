import Foundation

struct GeocodeModel: Codable {
    let response: Response
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct Response: Codable {
    let geoObjectCollection: GeoObjectCollection
    
    enum CodingKeys: String, CodingKey {
        case geoObjectCollection = "GeoObjectCollection"
    }
}

struct GeoObjectCollection: Codable {
    let featureMember: [FeatureMember]
}

struct FeatureMember: Codable  {
    let geoObject: GeoObject
    
    enum CodingKeys: String, CodingKey {
        case geoObject = "GeoObject"
    }
}

struct GeoObject: Codable {
    let name: String
    let description: String
    let point: Point
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case point = "Point"
    }
}

struct Point: Codable {
    let pos: String
}
