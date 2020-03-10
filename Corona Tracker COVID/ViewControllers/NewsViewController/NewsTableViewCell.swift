//
//  NewsTableViewCell.swift
//  Corona Tracker COVID
//
//  Created by Jayesh Mardiya on 10/03/20.
//  Copyright © 2020 Jayesh Mardiya. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var labelNewsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
