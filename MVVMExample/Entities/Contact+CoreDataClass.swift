//
//  Contact+CoreDataClass.swift
//  ViperExample
//
//  Created by Phuong Nguyen on 11/16/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//
//

import Foundation
import CoreData

private let kContact = "Contact"

@objc(Contact)
public class Contact: NSManagedObject {

    class func saveContact(firstName: String?, lastName: String?) -> Contact? {
        let contact = NSEntityDescription.insertNewObject(forEntityName: kContact, into: CoreDataStore.persistentContainer.viewContext) as? Contact
        contact?.firstName = firstName
        contact?.lastName = lastName
        CoreDataStore.saveContext()
        return contact
    }
    
    class func getAllContact() -> [Contact] {
        var contacts = [Contact]()
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: kContact)
            if let arrayContact = try CoreDataStore.persistentContainer.viewContext.fetch(fetchRequest) as? [Contact] {
                contacts.append(contentsOf: arrayContact)
            }
        } catch {
            print("Could not fetch: \(error), \(error.localizedDescription)")
        }
        return contacts
    }
    
}
