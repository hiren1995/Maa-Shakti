//
//  MenuTableViewCell.swift
//  Maa Shakti
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var imgItem: UIImageView!
    @IBOutlet var lblItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
