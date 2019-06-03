//
//  ToDoTableViewCell.swift
//  lesson20
//
//  Created by Yury Popov on 31/05/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var todoLabell: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
