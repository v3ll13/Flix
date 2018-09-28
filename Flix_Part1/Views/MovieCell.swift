//
//  MovieCell.swift
//  Flix_Part1
//
//  Created by MacBookPro9 on 9/17/18.
//  Copyright © 2018 MacBookPro9. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var title_Label: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
