//
//  offlineController.swift
//  tictactoe
//
//  Created by SUP'Internet 02 on 13/06/2018.
//  Copyright © 2018 SUP'Internet 02. All rights reserved.
//

import UIKit

class OnlineController: UIViewController {
    var values: Array = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var playerTurn: Int = 1
    var playerImg1 = UIImage(named: "Tic-tac-toe-cross")
    var playerImg2 = UIImage(named: "Tic-tac-toe-o")
    @IBOutlet weak var winnerText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func handleClick(_ sender: UIButton) {
        if (playerTurn == 1 && self.values[sender.tag] == 0) {
            sender.setImage(playerImg1, for: .normal)
            self.values[sender.tag] = self.playerTurn

        }
        else if (playerTurn == 2 && self.values[sender.tag] == 0){
            sender.setImage(playerImg2, for: .normal)
            self.values[sender.tag] = self.playerTurn

        }
        if(
            (self.values[0] != 0 && self.values[0] == self.values[1] && self.values[1] == self.values[2]) ||
            (self.values[3] != 0 && self.values[3] == self.values[4] && self.values[4] == self.values[5]) ||
            (self.values[6] != 0 && self.values[6] == self.values[7] && self.values[7] == self.values[8]) ||
            (self.values[0] != 0 && self.values[0] == self.values[3] && self.values[3] == self.values[6]) ||
            (self.values[1] != 0 && self.values[1] == self.values[4] && self.values[4] == self.values[7]) ||
            (self.values[2] != 0 && self.values[2] == self.values[5] && self.values[5] == self.values[8]) ||
            (self.values[0] != 0 && self.values[0] == self.values[4] && self.values[4] == self.values[8]) ||
            (self.values[2] != 0 && self.values[2] == self.values[4] && self.values[4] == self.values[6])
        ) {
            if (playerTurn == 1) {
                winnerText.text = "X won the game"
                return
            }
            else {
               winnerText.text = "O won the game"
                return
            }
        }
        
        self.playerTurn = (self.playerTurn == 1 ? 2 : 1)
    }
    
    
}
