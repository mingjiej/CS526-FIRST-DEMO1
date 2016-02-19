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
    var monsterIndex = Int(2)
    var totalScore = Double(0)
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGame()
        // Do any additional setup after loading the view.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        loadGame()
    }
    func loadGame(){
        var scene = MonsterGameScene(size: CGSize(width: 750, height: 1134), num: monsterIndex)// Configure the view.
        scene.scaleMode = .AspectFill

        if(UIScreen.mainScreen().bounds.height < 500){
            print("true")
            scene = MonsterGameScene(size: CGSize(width: 640, height: 960), num: monsterIndex)
            scene.scaleMode = .Fill
        }
        scene.beforeViewController = self

        let skView = self.view as! SKView
        //        skView.showsFPS = true
        //        skView.showsNodeCount  = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
    func back(score: Double) {
        totalScore = score
        self.performSegueWithIdentifier("monster", sender: nil)
    }
    override func viewDidDisappear(animated: Bool) {
        let skView = self.view as! SKView
        stopBackGroundMusic()
//        self.navigationController?.popToRootViewControllerAnimated(true)
        self.dismissViewControllerAnimated(true, completion: {skView.presentScene(nil)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "monster") {
            let svc : GameOverViewController = segue.destinationViewController as! GameOverViewController
            svc.toPass = "\(totalScore)"
            svc.modeIndex = 3
            svc.beforeViewControllerB = self

        }
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
