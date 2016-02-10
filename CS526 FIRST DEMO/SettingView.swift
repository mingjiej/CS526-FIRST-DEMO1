//
//  SettingView.swift
//  CS526 FIRST DEMO
//
//  Created by Xiaoya Hang on 10/20/15.
//  Copyright © 2015 User. All rights reserved.
//

import UIKit
import AVFoundation
import Social

var count = 1
class SettingView:UIViewController{

    @IBOutlet weak var difficultyLabel: UIButton!
    @IBOutlet weak var tabBarBackground: UIView!
    @IBOutlet weak var tabBar: UIView!
    
    @IBOutlet weak var easyLabel: UIButton!
    @IBOutlet weak var mediumLabel: UIButton!
    @IBOutlet weak var hardLabel: UIButton!
    
    @IBOutlet weak var instructionLabel: UIButton!
    @IBOutlet weak var aboutLabel: UIButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fightground_shenmiao.jpg")!)
        difficultyLabel.layer.borderWidth = 1
        difficultyLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        instructionLabel.layer.borderWidth = 1
        instructionLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        aboutLabel.layer.borderWidth = 1
        aboutLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.easyLabel.alpha = 0
        self.mediumLabel.alpha = 0
        self.hardLabel.alpha = 0
        self.tabBar.alpha = 0
        self.tabBarBackground.alpha = 0
        
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        switch (DataStruct.difficulty) {
        case DataStruct.EASY :
            easyLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            mediumLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
            hardLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        case DataStruct.MEDIUM :
            easyLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
            mediumLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            hardLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            let width = self.tabBar.frame.width
            
            UIView.animateWithDuration(0.05, animations:{ () -> Void in
                self.tabBar.transform = CGAffineTransformMakeTranslation(width, 0)
                }, completion : nil)
        case DataStruct.HARD :
            easyLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
            mediumLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            
            hardLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            let width = self.tabBar.frame.width
            
            UIView.animateWithDuration(0.05, animations:{ () -> Void in
                self.tabBar.transform = CGAffineTransformMakeTranslation(width * 2, 0)
                }, completion : nil)
        default:
            break
        }
    }
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    @IBAction func back(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func difficultyButton(sender: UIButton) {
        if( self.easyLabel.alpha != 1){
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.instructionLabel.transform = CGAffineTransformMakeTranslation(0, 50)
            self.aboutLabel.transform = CGAffineTransformMakeTranslation(0, 50)
            }){ (Bool) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.easyLabel.alpha = 1
                    self.mediumLabel.alpha = 1
                    self.hardLabel.alpha = 1
                    self.tabBar.alpha = 1
                    self.tabBarBackground.alpha = 1
                })
            }
        }else{
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.easyLabel.alpha = 0
                self.mediumLabel.alpha = 0
                self.hardLabel.alpha = 0
                self.tabBar.alpha = 0
                self.tabBarBackground.alpha = 0

                }){ (Bool) -> Void in
                    
                    UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        self.instructionLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                        self.aboutLabel.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)
            }
        }

    }
    
    @IBAction func goEasy(sender: UIButton) {
    
        easyLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
     
        mediumLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
      
        hardLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        UIView.animateWithDuration(0.4, animations:{ () -> Void in
            self.tabBar.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion : nil)
        
        DataStruct.difficulty = DataStruct.EASY
        print("easy")

    }
    @IBAction func goMedium(sender: UIButton) {
        
        easyLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        mediumLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        hardLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        let width = self.tabBar.frame.width

        UIView.animateWithDuration(0.4, animations:{ () -> Void in
            self.tabBar.transform = CGAffineTransformMakeTranslation(width, 0)
            }, completion : nil)
        
        DataStruct.difficulty = DataStruct.MEDIUM
        
        print("medium")
    }
    @IBAction func goHard(sender: UIButton) {
        
        easyLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        mediumLabel.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
        hardLabel.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        let width = self.tabBar.frame.width

        
        UIView.animateWithDuration(0.4, animations:{ () -> Void in
            self.tabBar.transform = CGAffineTransformMakeTranslation(width * 2, 0)
            }, completion : nil)
        
         DataStruct.difficulty = DataStruct.HARD
        print("hard")

    }
    
    
     @IBAction func connectFacebook( sender: UIButton ){
      let shareWithFacebook = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
       
        shareWithFacebook.setInitialText("Sharing an interesting iOS Game : Triple Bubble")
        shareWithFacebook.addURL(NSURL(string:"https://github.com/triplebubble/demo2"))
         self.presentViewController(shareWithFacebook, animated: true, completion: nil)
    }
    
    
    
    @IBAction func connectTwitter( sender: UIButton ){
        let shareWithTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        shareWithTwitter.setInitialText("Sharing an interesting iOS Game : Triple Bubble")
        shareWithTwitter.addURL(NSURL(string:"https://github.com/triplebubble/demo2"))

        self.presentViewController(shareWithTwitter, animated: true, completion: nil)
    }
}
