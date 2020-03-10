import Foundation

// MARK: - Attributes
class Attributes: Codable {
    
    var objectid: Int?
    var provinceState: String?
    var countryRegion: String?
    var lastUpdate: Int?
    var lat: Double?
    var long: Double?
    var confirmed: Int?
    var deaths: Int?
    var recovered: Int?
    
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
    
    func encode(with coder: NSCoder) {
        self.objectid = coder.decodeObject(forKey: "objectid") as? Int
        self.provinceState = coder.decodeObject(forKey: "provinceState") as? String
        self.countryRegion = coder.decodeObject(forKey: "countryRegion") as? String
        self.lastUpdate = coder.decodeObject(forKey: "lastUpdate") as? Int
        self.lat = coder.decodeObject(forKey: "lat") as? Double
        self.long = coder.decodeObject(forKey: "long") as? Double
        self.confirmed = coder.decodeObject(forKey: "confirmed") as? Int
        self.deaths = coder.decodeObject(forKey: "deaths") as? Int
        self.recovered = coder.decodeObject(forKey: "recovered") as? Int
    }
    
    required init?(coder: NSCoder) {
        coder.encode(self.objectid, forKey: "objectid")
        coder.encode(self.provinceState, forKey: "provinceState")
        coder.encode(self.countryRegion, forKey: "countryRegion")
        coder.encode(self.lastUpdate, forKey: "lastUpdate")
        coder.encode(self.lat, forKey: "lat")
        coder.encode(self.long, forKey: "long")
        coder.encode(self.confirmed, forKey: "confirmed")
        coder.encode(self.deaths, forKey: "deaths")
        coder.encode(self.recovered, forKey: "recovered")
    }
}
