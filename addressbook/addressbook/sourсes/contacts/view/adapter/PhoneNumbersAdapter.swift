//
//  PhoneNumbersAdapter.swift
//  addressbook
//
//  Created by Anna Zharkova on 24.11.2020.
//

import Foundation
import UIKit

class PhoneNumbersAdapter: NSObject, UITableViewDelegate, UITableViewDataSource {
    private var items = [PhoneModel]()
    weak var owner: TableOwner?
    
    func updateItems(items: [PhoneModel]) {
        self.items = [PhoneModel]()
        self.items.append(contentsOf: items)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneNumberCell.cellId, for: indexPath) as? PhoneNumberCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.setupItem(item: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.owner?.selected(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0000001
    }
}
