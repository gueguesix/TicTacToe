//
//  connectController.swift
//  tictactoe
//
//  Created by SUP'Internet 05 on 27/06/2018.
//  Copyright © 2018 SUP'Internet 02. All rights reserved.
//

import UIKit
import SocketIO

class connectController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TTTSocket.sharderinstance.connect()
        
        TTTSocket.sharderinstance.socket.on("join_game", callback: { (data, ack) in
            self.performSegue(withIdentifier: "onlineController", sender: data)
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "onlineController"){
            let controller = segue.destination as! onlineController
            controller.data = sender
        }
    }
    
    @IBAction func playsOnlinePressed(_ sender: UIButton) {
        print("kekl0rd")
        
        switch TTTSocket.sharderinstance.socket.status {
        case SocketIOClientStatus.connected:
            print("connectedd")
        case SocketIOClientStatus.connecting:
            print("connecting")
        case SocketIOClientStatus.disconnected:
            print("disconnected")
        case SocketIOClientStatus.notConnected:
            print("not connected")
        }
        
        TTTSocket.sharderinstance.socket.emit("join_queue", "kekl0rd")
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
