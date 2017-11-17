//
//  ListViewController.swift
//  MVVMExample
//
//  Created by Phuong Nguyen on 11/17/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableViewList: UITableView!
    
    var viewModel: ListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableViewList.register(ContactCell.self)
        self.tableViewList.addActivityFooter()
        self.viewModel.getAllContact()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func actionShowAdd(_ sender: UIBarButtonItem) {
        self.showListModule()
    }
    
}

extension ListViewController {
    
    func showListModule() {
        let navView = UIStoryboard(name: Storyboards.Main.name, bundle: Bundle.main).instantiateViewController(withIdentifier: Storyboards.Main.NavAddViewController)
        guard let view = navView.childViewControllers.first as? AddViewController else {
            return
        }
        let viewModel = AddViewModel()
        view.viewModel = viewModel
        view.didAddContact = { [weak self] (contact) in
            self?.viewModel.arrayContact.append(contact)
            let indexPath = IndexPath(row: (self?.viewModel?.arrayContact.count)! - 1, section: 0)
            self?.tableViewList.beginUpdates()
            self?.tableViewList.insertRows(at: [indexPath], with: .automatic)
            self?.tableViewList.endUpdates()
        }
        self.navigationController?.show(navView, sender: nil)
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.arrayContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        let contact = self.viewModel.arrayContact[indexPath.row]
        cell.configCell(contact)
        
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    
}
