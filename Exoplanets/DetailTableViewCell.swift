//
//  DetailTableViewCell.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.26.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell, DetailInfoTransfer {
    func setDetails(item: Planet) {
        nameTitleLabel.text = unwrapString(value: item.name)
        systemTitleLabel.text = unwrapString(value: item.coordinates?.system)
        rightAscensionTitleLabel.text = unwrapDouble(value: item.coordinates?.right_ascension)
        rightAscensionUnitTitleLabel.text = unwrapString(value: item.coordinates?.right_ascension_units)
        declinationTitleLabel.text = unwrapDouble(value: item.coordinates?.declination)
        declinationUnitsTitleLabel.text = unwrapString(value: item.coordinates?.declination_units)
        epochTitleLabel.text = unwrapInt(value: item.coordinates?.epoch)
        massTitleLabel.text = unwrapDouble(value: item.mass?.value)
        radiusTitleLabel.text = unwrapDouble(value: item.radius?.value)
        eccentricityTitleLabel.text = unwrapDouble(value: item.eccentricity?.value)
        //        if item.coordinates?.epoch != nil {
        //            epochTitleLabel.text = "\(item.coordinates!.epoch!)"
        //        }
        
    }
    
    func unwrapString (value: String?) -> String {
        if value != nil {
            return value!
        }
        return ""
    }
    
    func unwrapDouble (value: Double?) -> String {
        if value != nil {
            return "\(value!)"
        }
        return ""
    }
    
    func unwrapInt (value: Int?) -> String {
        if value != nil {
            return "\(value!)"
        }
        return ""
    }

    
    
    @IBOutlet weak var nameTitleLabel: UILabel!
    
    @IBOutlet weak var systemTitleLabel: UILabel!
    
    @IBOutlet weak var rightAscensionTitleLabel: UILabel!
    
    @IBOutlet weak var rightAscensionUnitTitleLabel: UILabel!
    
    @IBOutlet weak var declinationTitleLabel: UILabel!
    
    @IBOutlet weak var declinationUnitsTitleLabel: UILabel!
    
    @IBOutlet weak var epochTitleLabel: UILabel!
    
    @IBOutlet weak var massTitleLabel: UILabel!
    
    @IBOutlet weak var radiusTitleLabel: UILabel!
    
    @IBOutlet weak var eccentricityTitleLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
