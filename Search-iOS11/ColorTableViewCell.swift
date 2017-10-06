//
//  ColorTableViewCell.swift
//  Search-iOS11
//
//  Created by Taylor Mott on 05-Oct-17.
//  Copyright © 2017 Mott Applications. All rights reserved.
//

import UIKit

class ColorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with color: Color) {
        label.text = color.name
        colorView.backgroundColor = color.uiColor
    }

}
