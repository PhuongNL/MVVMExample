//
//  TableViewExtension.swift
//  ViperExample
//
//  Created by Phuong Nguyen on 11/15/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit

private let kActivityViewTag            = 9998

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UITableViewCell: ReusableView {}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
    
}

extension UITableView {
    
    func addActivityFooter() {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 40)
        activityIndicatorView.tag = kActivityViewTag
        activityIndicatorView.hidesWhenStopped = true
        self.tableFooterView = activityIndicatorView
    }
    
    func removeActivityFooter() {
        if let activityIndicatorView = self.viewWithTag(kActivityViewTag) as? UIActivityIndicatorView {
            activityIndicatorView.removeFromSuperview()
        }
    }
    
    func startAnimatingActivityFooter() {
        if let activityIndicatorView = self.viewWithTag(kActivityViewTag) as? UIActivityIndicatorView {
            activityIndicatorView.startAnimating()
        }
    }
    
    func stopAnimatingActivityFooter() {
        if let activityIndicatorView = self.viewWithTag(kActivityViewTag) as? UIActivityIndicatorView {
            activityIndicatorView.stopAnimating()
        }
    }
    
}
