//
//  TableViewCell.swift
//  authTest
//
//  Created by WSR on 14/11/2019.
//  Copyright © 2019 WSR. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameLaba: UILabel!
    
    @IBOutlet weak var imagView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
