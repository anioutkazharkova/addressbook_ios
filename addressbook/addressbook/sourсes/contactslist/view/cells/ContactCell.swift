//
//  ContactCell.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupItem(item: ContactModel) {
        self.nameLabel.text = item.name
        self.phoneLabel.text = item.phone
        if let imageData = item.avatarData {
            self.contactImage.image = UIImage(data: imageData)
        } else {
            self.contactImage.image = UIImage(named: "placeholder")
        }
    }
    
}
