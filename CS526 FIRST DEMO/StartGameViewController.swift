//
//  StartGame.swift
//  CS526 FIRST DEMO
//
//  Created by User on 10/11/15.
//  Copyright © 2015 User. All rights reserved.
//

import Foundation
import UIKit


class StartGameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroud_raffleanimation.jpg")!)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        if #available(iOS 8.0, *) {
            navigationController?.hidesBarsOnTap = false
        } else {
            // Fallback on earlier versions
        };
    }

    @IBAction func scoreMode(sender: UIButton) {
        if DataStruct.gameViewController != nil{
            self.presentViewController(DataStruct.gameViewController!, animated: true, completion: nil
            )
        }else{
            DataStruct.gameViewController =  self.storyboard?.instantiateViewControllerWithIdentifier("gameView") as! GameViewController
            self.presentViewController(DataStruct.gameViewController!, animated: true, completion: nil
            )
        }
    }
    
    @IBAction func bossMode(sender: UIButton) {
        if DataStruct.monsterViewController != nil{
            self.presentViewController(DataStruct.monsterViewController!, animated: true, completion: nil
            )
        }else{
            DataStruct.monsterViewController =  self.storyboard?.instantiateViewControllerWithIdentifier("monsterView") as! MonsterViewController
            self.presentViewController(DataStruct.monsterViewController!, animated: true, completion: nil
            )
        }
    }
    
}