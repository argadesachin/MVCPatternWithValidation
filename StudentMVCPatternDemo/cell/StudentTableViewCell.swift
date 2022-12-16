//
//  StudentTableViewCell.swift
//  StudentMVCPatternDemo
//
//  Created by Mac on 09/11/22.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var StudentIdLabel: UILabel!
    @IBOutlet weak var StudentFirstNameLabel: UILabel!
    @IBOutlet weak var StudentLastNameLabel: UILabel!
    @IBOutlet weak var StudentMarksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
