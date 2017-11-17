//
//  LoadingViewController.swift
//  MVVMExample
//
//  Created by Phuong Nguyen on 11/17/17.
//  Copyright © 2017 Phuong Nguyen. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    var viewModel: LoadingViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        Utils.delay(seconds: 2) {
            self.showMainModule()
        }
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
    
}

extension LoadingViewController {
    
    func showMainModule() {
        let navView = UIStoryboard(name: Storyboards.Main.name, bundle: Bundle.main).instantiateViewController(withIdentifier: Storyboards.Main.NavListViewController)
        guard let view = navView.childViewControllers.first as? ListViewController else {
            return
        }
        let viewModel = ListViewModel()
        view.viewModel = viewModel
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = navView
    }
    
}
