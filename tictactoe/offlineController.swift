//
//  offlineController.swift
//  tictactoe
//
//  Created by SUP'Internet 02 on 13/06/2018.
//  Copyright © 2018 SUP'Internet 02. All rights reserved.
//

import UIKit

class offlineController: UIViewController {
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
                let alert = UIAlertController(title: "C'est fini !", message: "C'est la croix qui a gagné", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Retour à la page d'accueil", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                alert.addAction(UIAlertAction(title: "Recommencer", style: .default, handler: { (_) in
                    for i in 0...8 {
                        self.values = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                        var test = self.view.viewWithTag(i) as? UIButton
                        test?.setImage(nil, for: [])
                    }
                }))
                
                self.present(alert, animated: true)
            }
            else if (playerTurn == 2){
                let alert = UIAlertController(title: "C'est fini !", message: "C'est le rond qui a gagné", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Retour à la page d'accueil", style: .default, handler: { (_) in
                    self.dismiss(animated: true, completion: nil)
                }))
                
                alert.addAction(UIAlertAction(title: "Recommencer", style: .default, handler: { (_) in
                    self.values = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                    for i in 0...8 {
                        var test = self.view.viewWithTag(i) as? UIButton
                        test?.setImage(nil, for: [])
                    }
                }))
                
                self.present(alert, animated: true)
            }
        }


        self.playerTurn = (self.playerTurn == 1 ? 2 : 1)
    }
    
    
}
