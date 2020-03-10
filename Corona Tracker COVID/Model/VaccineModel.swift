//
//  VaccineModel.swift
//  Corona Tracker COVID
//
//  Created by Niraj on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import Foundation

class VaccineModel: Codable {
    
    var date: String?
    var description: String?
    var source: String?
    
    init?(dictionary: [String : Any]) {
        self.date = dictionary["date"] as? String
        self.description = dictionary["description"] as? String
        self.source = dictionary["source"] as? String
    }
    
    func encode(with coder: NSCoder) {
        self.date = coder.decodeObject(forKey: "date") as? String
        self.description = coder.decodeObject(forKey: "description") as? String
        self.source = coder.decodeObject(forKey: "source") as? String
    }
    
    required init?(coder: NSCoder) {
        coder.encode(self.date, forKey: "date")
        coder.encode(self.description, forKey: "description")
        coder.encode(self.source, forKey: "source")
    }
}
