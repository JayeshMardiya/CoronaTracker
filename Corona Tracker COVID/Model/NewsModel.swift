//
//  NewsModel.swift
//  Corona Tracker COVID
//
//  Created by Niraj on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import Foundation

class NewsModel: Codable {
    
    var imageURL: String?
    var newURL: String?
    var title: String?
    
    init?(dictionary: [String : Any]) {
        self.imageURL = dictionary["imageURL"] as? String
        self.newURL = dictionary["newURL"] as? String
        self.title = dictionary["title"] as? String
    }
    
    func encode(with coder: NSCoder) {
        self.imageURL = coder.decodeObject(forKey: "imageURL") as? String
        self.newURL = coder.decodeObject(forKey: "newURL") as? String
        self.title = coder.decodeObject(forKey: "title") as? String
    }
    
    required init?(coder: NSCoder) {
        coder.encode(self.imageURL, forKey: "imageURL")
        coder.encode(self.newURL, forKey: "newURL")
        coder.encode(self.title, forKey: "title")
    }
}
