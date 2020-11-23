//
//  ServiceLocator.swift
//  addressbook
//
//  Created by Anna Zharkova on 23.11.2020.
//

import Foundation

protocol IServiceLocator {
    func getService<T>(type: T.Type) -> T?
    
    func addService<T>(service: T)
}

class ServiceLocator : NSObject, IServiceLocator{
    static let shared = ServiceLocator()
    
    private var services: [String: Any] = [String : Any]()
    
    private override init() {
        super.init()
    }
    
    func getService<T>(type: T.Type) -> T? {
        return services[String(describing: type)] as? T
    }
    
    func addService<T>(service: T) {
        let type =  String(describing: T.self)
        if services[type] == nil {
            services[type] = service
        }
    }
}
