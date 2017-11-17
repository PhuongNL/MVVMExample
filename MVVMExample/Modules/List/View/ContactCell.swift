//
//  ContactCell.swift
//  ViperExample
//
//  Created by Phuong Nguyen on 11/15/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var labelFullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(_ item: Contact) {
        let firstName = item.firstName ?? ""
        let lastName = item.lastName ?? ""
        let fullName = firstName + " " + lastName
        self.labelFullName.text = fullName
    }
    
}

extension ContactCell: NibLoadableView {}
