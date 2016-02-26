//
//  PhotoTableViewCell.swift
//  Instagram
//
//  Created by Tarang khanna on 2/25/16.
//  Copyright © 2016 Tarang khanna. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var insta_photo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
