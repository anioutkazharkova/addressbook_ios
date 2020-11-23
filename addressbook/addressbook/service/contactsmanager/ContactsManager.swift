//
//  ContactsManager.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation
import Contacts

enum PhoneTypes {
    case main, mobile, home, unknown
    
    var value: String {
        switch self {
        case .main:
            return "Main"
        case .mobile:
            return "Mobile"
        case .home:
            return "Home fax"
        default:
            return "Unknown"
        }
    }
}

extension String {
    var phoneType: PhoneTypes {
        switch self {
        case CNLabelPhoneNumberMain:
            return .main
        case CNLabelPhoneNumberMobile:
            return .mobile
        case CNLabelPhoneNumberHomeFax:
            return .home
        default:
            return .unknown
        }
    }
}

class ContactsManager {
    private lazy var store: CNContactStore = {
        return CNContactStore()
    }()
    
    private  let keys = [CNContactGivenNameKey,
                         CNContactFamilyNameKey,
                         CNContactPhoneNumbersKey,
                         CNContactImageDataAvailableKey,
                         CNContactThumbnailImageDataKey,
                         CNContactImageDataKey]
    
    func getAllContacts(success: @escaping([ContactInfo])->Void,
                        failure: @escaping(Error)->Void) {
        var contacts = [ContactInfo]()
        
        self.store.requestAccess(for: .contacts) {[weak self] (granted, error) in
            guard let self = self else {return}
            if let error = error {
                print("failed to request access", error)
                if !granted {
                    failure(DeniedAccessError(message:
                                                "Need to turf on the permission"))
                }else {
                failure(error)
                }
                return
            }
            if granted {
                let request = CNContactFetchRequest(keysToFetch: self.keys as [CNKeyDescriptor])
                do {
                    try self.store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        let firstName = contact.givenName
                        let lastName = contact.familyName
                        let phones = contact.phoneNumbers
                            .map{
                                Phone(phoneType: $0.label?.phoneType ?? PhoneTypes.unknown,
                                      phoneNumber: $0.value.stringValue)
                            }
                        let image = contact.imageData ?? contact.thumbnailImageData
                        
                        let item = ContactInfo(firstName: firstName, lastName: lastName, phones: phones, avatarData: image)
                        
                        contacts.append(item)
                    })
                    success(contacts)
                } catch let error {
                    print("Failed to enumerate contact", error)
                    failure(error)
                }
            } else {
                print("access denied")
                failure(DeniedAccessError(message:
                                            "Need to turf on the permission"))
            }
        }
    }
}

