//
//  StatusViewController.swift
//  StatusHub
//
//  Created by Subodh Jena on 14/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {
   
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Default Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
