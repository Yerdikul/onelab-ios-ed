//
//  UserTableViewCell.swift
//  one-lab-4.0
//
//  Created by NYerdikul on 10.03.2024.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var nameTitle: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func minusButttonPressed(_ sender: UIButton) {
    }
    @IBAction func plusButtonPressed(_ sender: Any) {
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
