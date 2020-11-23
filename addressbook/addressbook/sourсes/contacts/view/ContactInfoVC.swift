//
//  ContactInfoVC.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import UIKit

class ContactInfoVC: UIViewController, IContactInfoView {
    var output: IContactInfoInteractor?
    
    var router: IRouter?
    

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phonesList: UITableView!
    
    private var source: PhoneNumbersAdapter? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phonesList.nib(id: PhoneNumberCell.cellId)
        self.output?.loadContent()
    }

    func setup(model: ContactInfoViewModel) {
        if let imageData = model.item.avatarData {
            self.contactImage.image = UIImage(data: imageData)
        }
        self.nameLabel.text = model.item.name
        self.source = PhoneNumbersAdapter()
        self.source?.updateItems(items: model.item.phones)
        self.phonesList.dataSource = self.source
        self.phonesList.delegate = self.source
        self.phonesList.reloadData()
    }
}
