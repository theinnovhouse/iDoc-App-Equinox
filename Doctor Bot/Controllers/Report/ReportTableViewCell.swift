//
//  ReportTableViewCell.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 30/01/21.
//

import UIKit

class ReportTableViewCell: UITableViewCell {

    @IBOutlet var issueLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var doctorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
