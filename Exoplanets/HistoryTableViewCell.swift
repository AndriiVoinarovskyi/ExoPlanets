//
//  HistoryTableViewCell.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.18.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell, IndexTransition {

    @IBOutlet weak var label: UILabel!
    
    func setTitleByIndex(value: String) {
        label.text = value
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
