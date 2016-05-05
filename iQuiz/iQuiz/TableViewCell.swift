//
//  TableViewCell.swift
//  iQuiz
//
//  Created by MyungJin Eun on 5/4/16.
//  Copyright © 2016 MyungJin Eun. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var subtitle: UILabel!    
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
