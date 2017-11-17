//
//  AddViewModel.swift
//  MVVMExample
//
//  Created by Phuong Nguyen on 11/17/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import Foundation
import CoreData

class AddViewModel {

    @discardableResult
    func createContact(firstName: String?, lastName: String?) -> Contact? {        
        let contact = Contact.saveContact(firstName: firstName, lastName: lastName)
        return contact
    }
    
}
