//
//  Utils.swift
//  Conomin
//
//  Created by Phuong Nguyen on 6/19/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    class func validEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    
    /// validate full name, just for ascii
    ///
    /// - Parameter fullName: ascii characters
    /// - Returns: check
    class func validFullName(_ fullName: String) -> Bool {
        let regEx = "^[0-9a-zA-Z\\_ ]{2,16}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: fullName)
    }
    
    class func delay(seconds: Double, execute: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: execute)
    }
    
    class func format(dateString date: String, fromFormat ffm: String, toFormat tfm: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ffm
        if let dateObj = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = tfm
            return dateFormatter.string(from: dateObj)
        }
        return nil
    }
    
}
