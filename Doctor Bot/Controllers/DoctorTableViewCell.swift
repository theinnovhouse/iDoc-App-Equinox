//
//  DoctorTableViewCell.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 05/02/21.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet var name:UILabel!
    @IBOutlet var rate:UILabel!
    @IBOutlet var time:UILabel!
    @IBOutlet var special:UILabel!
    @IBOutlet var docImage:UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
