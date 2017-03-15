//
//  StatusViewController.swift
//  StatusHub
//
//  Created by Subodh Jena on 14/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import UIKit
import SocketIO

class StatusViewController: UIViewController {
   
    // MARK: - Private Declarations
    
    var statusMessages : [Post] = []{
        
        didSet{
            tableView.reloadData()
        }
    }
    
    // MARK: - IBOutlets
   
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Controller Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(StatusViewController.handleStatusMessageNotification(_:)), name: NSNotification.Name(rawValue: "statusMessage"), object: nil)

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

    // MARK: - IBActions
    
    @IBAction func didTapShare(_ sender: Any) {
        
    }
    
    func handleStatusMessageNotification(_ notification: Notification) {
        
        let statusDictionary = notification.object as! [String : AnyObject]
   
        // Create Post
        let post = Post(dictionary: statusDictionary as NSDictionary)
        statusMessages.append(post!)
        statusMessages.reverse()
    }
}


// MARK: - TableView DataSource

extension StatusViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: StatusTableViewCell.reuseIdentifier, for: indexPath) as! StatusTableViewCell
        cell.post = statusMessages[indexPath.row]
        
        return cell
    }
}

// MARK: - TableView Delegate

extension StatusViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StatusTableViewCell.cellHeight
    }
}

