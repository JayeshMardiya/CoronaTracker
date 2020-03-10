import Foundation

// MARK: - Attributes
struct Attributes {
    let objectid: Int?
    let provinceState: String?
    let countryRegion: String?
    let lastUpdate: Int?
    let lat: Double?
    let long: Double?
    let confirmed: Int?
    let deaths: Int?
    let recovered: Int?
    
    init?(dictionary: [String : Any]) {
        self.objectid = dictionary["objectid"] as? Int
        self.provinceState = dictionary["provinceState"] as? String
        self.countryRegion = dictionary["countryRegion"] as? String
        self.lastUpdate = dictionary["lastUpdate"] as? Int
        self.lat = dictionary["lat"] as? Double
        self.long = dictionary["long"] as? Double
        self.confirmed = dictionary["confirmed"] as? Int
        self.deaths = dictionary["deaths"] as? Int
        self.recovered = dictionary["recovered"] as? Int
    }
}
