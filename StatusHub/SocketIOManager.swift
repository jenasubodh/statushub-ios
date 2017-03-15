//
//  SocketIOManager.swift
//  StatusHub
//
//  Created by Subodh Jena on 16/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import Foundation
import SocketIO

class SocketIOManager: NSObject {
   
    static let sharedInstance = SocketIOManager()
   
    var socket = SocketIOClient(socketURL: URL(string: "https://statushub-dev.herokuapp.com")!, config: [.log(false), .forcePolling(true)])
    
    override init() {
        super.init()
        
        socket.on("status") { data, ack in
            
            NotificationCenter.default
                .post(name: Notification.Name(rawValue: "statusMessage"), object: data[0] as? [String: AnyObject])
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
