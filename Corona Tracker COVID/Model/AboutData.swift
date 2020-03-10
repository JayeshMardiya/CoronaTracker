//
//  AboutData.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import Foundation

class AboutData: Codable {
    
    var sourceUrl: String?
    
    init?(dictionary: [String : Any]) {
        self.sourceUrl = dictionary["sourceUrl"] as? String
    }
    
    func encode(with coder: NSCoder) {
        self.sourceUrl = coder.decodeObject(forKey: "sourceUrl") as? String
    }
    
    required init?(coder: NSCoder) {
        coder.encode(self.sourceUrl, forKey: "sourceUrl")
    }
}
