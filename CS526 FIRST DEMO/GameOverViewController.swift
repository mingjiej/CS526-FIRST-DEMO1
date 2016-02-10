//
//  GameOverViewController.swift
//  CS526 FIRST DEMO
//
//  Created by User on 10/20/15.
//  Copyright © 2015 User. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverViewController: UIViewController {
    
    var beforeViewController : GameViewController!
    var beforeViewControllerB : MonsterViewController!
    @IBOutlet weak var score: UILabel!
    var toPass: String = ""
    var modeIndex = Int(0)
    var highScore : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        NSUserDefaults.standardUserDefaults().setObject("0", forKey: "Highest")
        var target = ""
//        NSUserDefaults.standardUserDefaults().setObject("100000000000", forKey: "ShortestTime")
        if(modeIndex == 3) {
            if (NSUserDefaults.standardUserDefaults().objectForKey("ShortestTime") != nil &&  Double(toPass) <= Double(NSUserDefaults.standardUserDefaults().objectForKey("ShortestTime") as! String)) {
                NSUserDefaults.standardUserDefaults().setObject(toPass, forKey: "ShortestTime")
                target = toPass
            }else if NSUserDefaults.standardUserDefaults().objectForKey("ShortestTime") == nil{
                target = toPass
                NSUserDefaults.standardUserDefaults().setObject(toPass, forKey: "ShortestTime")}
            else {
                target = NSUserDefaults.standardUserDefaults().objectForKey("ShortestTime") as! String
            }
        } else {
            if (NSUserDefaults.standardUserDefaults().objectForKey("Highest") != nil && Int(toPass) >= Int(NSUserDefaults.standardUserDefaults().objectForKey("Highest") as! String)) {
                NSUserDefaults.standardUserDefaults().setObject(toPass, forKey: "Highest")
                target = toPass
            } else if NSUserDefaults.standardUserDefaults().objectForKey("Highest") == nil{
                target = toPass
                NSUserDefaults.standardUserDefaults().setObject(toPass, forKey: "Highest")
            }else{
                target = NSUserDefaults.standardUserDefaults().objectForKey("Highest") as! String
            }
        }
        let scene = GameOverScene(size: CGSize(width: 750, height: 1134), Score: toPass, Number: modeIndex, HighScore: target)// Configure the view.
        scene.beforeViewController = beforeViewController
        scene.beforeViewControllerB = beforeViewControllerB
        scene.viewcontroller = self
        let skView = self.view as! SKView
        //        skView.showsFPS = true
        //        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        let skView = self.view as! SKView

        skView.presentScene(nil)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
