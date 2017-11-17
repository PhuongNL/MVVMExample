//
//  ListViewModel.swift
//  MVVMExample
//
//  Created by Phuong Nguyen on 11/17/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import Foundation

class ListViewModel {
    
    var arrayContact = [Contact]()
    
    func getAllContact() {
        self.arrayContact = Contact.getAllContact()
    }
    
}
