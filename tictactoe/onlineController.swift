//
//  onlineController.swift
//  tictactoe
//
//  Created by SUP'Internet 05 on 27/06/2018.
//  Copyright © 2018 SUP'Internet 02. All rights reserved.
//

import UIKit

class onlineController: UIViewController {
    
    var data: Any?
    var currentTurn: String = ""
    var gamer1: String = ""
    var gamer2: String = ""
    var meGamer: String = ""
    @IBOutlet weak var textGamer: UITextField!
    @IBOutlet weak var textTrun: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paramsArray = data as! NSArray
        let unwrappedDictJson = paramsArray[0] as! [String: Any]
        
        gamer1 = unwrappedDictJson["playerO"]! as! String
        gamer2 = unwrappedDictJson["playerX"]! as! String
        if (gamer1 == "kekl0rd"){
            textGamer.text = "Tu joues avec \(gamer2)"
            meGamer = gamer1
        }else{
            textGamer.text = "Tu joues avec \(gamer1)"
            meGamer = gamer2
        }
        
        currentTurn = unwrappedDictJson["currentTurn"]! as! String
        checkTurn(param: currentTurn)
        
        
        TTTSocket.sharderinstance.socket.on("movement", callback: { (data, ack) in
            let paramsArray = data as! NSArray
            let unwrappedDictJson = paramsArray[0] as! [String: Any]
            
            print(data)
            if (unwrappedDictJson["err"] != nil){
                if (unwrappedDictJson["player_played"] != nil){
                    let playerPlay = unwrappedDictJson["player_played"]! as! String
                    let index = unwrappedDictJson["index"]! as! Int
                    if (playerPlay == "o"){
                        if (index == 0){
                            let imgO = self.view.viewWithTag(10) as? UIButton
                            imgO?.setImage(UIImage(named: "Tic-tac-toe-o.png"), for: .normal)
                            self.checkTurn(param: self.currentTurn)
                        }else{
                            let imgO = self.view.viewWithTag(index) as? UIButton
                            imgO?.setImage(UIImage(named: "Tic-tac-toe-o.png"), for: .normal)
                            self.checkTurn(param: self.currentTurn)
                        }
                    }else if (playerPlay == "x"){
                        if (index == 0){
                            let imgX = self.view.viewWithTag(10) as? UIButton
                            imgX?.setImage(UIImage(named: "Tic-tac-toe-cross.png"), for: .normal)
                            self.checkTurn(param: self.currentTurn)
                        }else {
                            let imgX = self.view.viewWithTag(index) as? UIButton
                            imgX?.setImage(UIImage(named: "Tic-tac-toe-cross.png"), for: .normal)
                            self.checkTurn(param: self.currentTurn)
                        }
                    }
                }
                if (unwrappedDictJson["win"] != nil && unwrappedDictJson["win"]! as! Int == 1 ){
                    let winer = unwrappedDictJson["player_played"]!  as! String
                    if (winer == "x"){
                        let alert = UIAlertController(title: "C'est fini !", message: "Bravo à \(self.gamer2)", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "Retour à la page d'accueil", style: .default, handler: { (_) in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true)
                    }else if (winer == "o"){
                        let alert = UIAlertController(title: "C'est fini !", message: "Bravo à \(self.gamer1)", preferredStyle: .actionSheet)
                        alert.addAction(UIAlertAction(title: "Retour à la page d'accueil", style: .default, handler: { (_) in
                            self.dismiss(animated: true, completion: nil)
                        }))
                        self.present(alert, animated: true)
                    }
                }
            }
        })
    }
    @IBAction func PressedButton(_ sender: UIButton) {
        if (sender.tag == 10) {
           TTTSocket.sharderinstance.socket.emit("movement", 0 )
        }
        TTTSocket.sharderinstance.socket.emit("movement", (sender.tag) )
    }
    
    func checkTurn(param: String){
        if (currentTurn == "x"){
            textTrun.text = "c'est le tour de \(gamer2)"
            currentTurn = "o"
        }else if (currentTurn == "o"){
            textTrun.text = "c'est le tour de \(gamer1)"
            currentTurn = "x"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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


