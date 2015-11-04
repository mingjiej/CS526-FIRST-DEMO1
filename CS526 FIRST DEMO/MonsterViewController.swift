//
//  MonsterViewController.swift
//  CS526 FIRST DEMO
//
//  Created by User on 10/29/15.
//  Copyright © 2015 User. All rights reserved.
//

import UIKit
import SpriteKit
class MonsterViewController: UIViewController {
    var totalscore = String()
    var index = Int(0)
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MonsterGameScene(size: CGSize(width: 750, height: 1134))// Configure the view.
        scene.viewcontroller = self
        let skView = self.view as! SKView
        //        skView.showsFPS = true
        //        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func test(score: String, mode: Int) {
        totalscore = score
        index = mode
        performSegueWithIdentifier("monsterDead", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "monsterDead") {
            let svc: GameOverViewController = segue.destinationViewController as! GameOverViewController
            svc.toPass = totalscore
            svc.modeIndex = index
        }
    }
    // move to setting view
    @IBAction func toMenu(sender: UIButton) {
        let menuView = self.storyboard?.instantiateViewControllerWithIdentifier("settingView") as! SettingView
        self.presentViewController(menuView, animated: false, completion: nil)
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
