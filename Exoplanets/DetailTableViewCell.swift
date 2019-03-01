//
//  DetailTableViewCell.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.26.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell, DetailInfoTransfer {

    var labelHeight : CGFloat = 0
    
    @IBOutlet weak var fullDetailInfo: UILabel!
    
    func setDetails(item: Planet) {
        fullDetailInfo.text = item.printInfo()
        fullDetailInfo.numberOfLines = 0
        fullDetailInfo.lineBreakMode = .byWordWrapping
        fullDetailInfo.font = UIFont(name: "Futura", size: 17)
        fullDetailInfo.sizeToFit()
        labelHeight = fullDetailInfo.frame.height
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
