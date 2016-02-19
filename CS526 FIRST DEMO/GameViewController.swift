//
//  GameViewController.swift
//  CS526 FIRST DEMO
//
//  Created by User on 9/15/15.
//  Copyright (c) 2015 User. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var totalscore = String()
    var index = Int(0)
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGame()        
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidDisappear(animated: Bool) {
        let skView = self.view as! SKView
        stopBackGroundMusic()
        self.dismissViewControllerAnimated(true, completion: {
            skView.presentScene(nil)
        })

    }
    override func viewWillAppear(animated: Bool) {
        loadGame()
    }
    
    func loadGame(){
        var scene = GameScene(size: CGSize(width: 750, height: 1134) , gvcontroller: self)// Configure the view.
        scene.scaleMode = .AspectFill

        if(UIScreen.mainScreen().bounds.height < 500){
            print("true")
            scene = GameScene(size: CGSize(width: 640, height: 960) , gvcontroller: self)
            scene.scaleMode = .Fill
        }
        scene.viewcontroller = self
        let skView = self.view as! SKView
        //        skView.showsFPS = true
        //        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
    func test(score: String, mode: Int) {
//        self.view.removeFromSuperview()
        totalscore = score
        index = mode
        performSegueWithIdentifier("test", sender: nil)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "test") {
            let svc: GameOverViewController = segue.destinationViewController as! GameOverViewController
            svc.beforeViewController = self
            svc.toPass = totalscore
            svc.modeIndex = index
        }
    }
    // move to setting view

//        @IBAction func toSetting(sender: UIButton) {
//        
//        let menuView = self.storyboard?.instantiateViewControllerWithIdentifier("settingView") as! SettingView
//        self.presentViewController(menuView, animated: false, completion: nil)
//    }


}
