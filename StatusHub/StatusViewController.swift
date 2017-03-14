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
   
    // MARK: - IBOutlets
   
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - View Controller Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let socket = SocketIOClient(socketURL: URL(string: "http://localhost:9000")!, config: [.log(false), .forcePolling(false)])
        
        socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        socket.on("status") {data, ack in
            print("got some data !! \(data)")
        }
        
        socket.connect()
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
    
}
