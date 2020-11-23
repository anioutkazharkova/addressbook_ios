//
//  PhoneNumberCell.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import UIKit

class PhoneNumberCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupItem(item: PhoneModel) {
        self.typeLabel.text = item.type
        self.numberLabel.text = item.phone
    }
    
}
