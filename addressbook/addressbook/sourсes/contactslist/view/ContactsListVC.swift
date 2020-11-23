//
//  ContactsListVC.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import UIKit
import Contacts

class ContactsListVC: UIViewController, IContactsListView {
    var output: IContactsListInteractor?
    var router: IRouter?
    
    private var source: ContactsAdapter? = nil
    
    @IBOutlet weak var contactsList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactsList.nib(id: ContactCell.cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.contactsList.delegate = source
        self.contactsList.dataSource = source
        self.source?.owner = self
        
        self.output?.fetchContacts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.contactsList.delegate = nil
        self.contactsList.dataSource = nil
        self.source?.owner = nil
        super.viewWillDisappear(animated)
    }
    
    func setup(model: ContactsListViewModel) {
        if source == nil {
            source = ContactsAdapter()
        }
        self.source?.updateItems(items: model.items)
        self.contactsList.delegate = source
        self.contactsList.dataSource = source
        self.source?.owner = self
        self.contactsList.reloadData()
    }
    
    func showSettings() {
        DispatchQueue.main.async {
            self.showMessage(message: "Need to turf on the permission") {
                if let url = URL.init(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}

extension ContactsListVC : TableOwner {
    func selected(at index: Int) {
        self.output?.selectContact(at: index)
        self.router?.performMove(transition: .contact, self.output)
    }
}
