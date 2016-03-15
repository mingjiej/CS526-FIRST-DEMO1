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
import MessageUI

var count = 1
class SettingView:UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var difficultyLabel: UIButton!
    @IBOutlet weak var tabBarBackground: UIView!
    @IBOutlet weak var tabBar: UIView!
    
    @IBOutlet weak var easyLabel: UIButton!
    @IBOutlet weak var mediumLabel: UIButton!
    @IBOutlet weak var hardLabel: UIButton!
    
    @IBOutlet weak var instructionLabel: UIButton!
    @IBOutlet weak var aboutLabel: UIButton!
    @IBOutlet weak var shareLabel: UIButton!
    @IBOutlet weak var feedbackLabel: UIButton!
    
    @IBOutlet weak var shareButtonStack: UIStackView!
    
    var instructionLabelOffset : CGFloat = 0
    var aboutLabelOffset : CGFloat = 0
    var shareLabelOffset : CGFloat = 0
    var feedbackLabelOffset : CGFloat = 0
    var shareStackOffset : CGFloat = 0
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "fightground_shenmiao.jpg")!)
        difficultyLabel.layer.borderWidth = 1
        difficultyLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        instructionLabel.layer.borderWidth = 1
        instructionLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        aboutLabel.layer.borderWidth = 1
        aboutLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        shareLabel.layer.borderWidth = 1
        shareLabel.layer.borderColor = UIColor.whiteColor().CGColor
        feedbackLabel.layer.borderWidth = 1
        feedbackLabel.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.easyLabel.alpha = 0
        self.mediumLabel.alpha = 0
        self.hardLabel.alpha = 0
        self.tabBar.alpha = 0
        self.tabBarBackground.alpha = 0
        self.shareButtonStack.alpha = 0
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {

    }
    override func viewDidAppear(animated: Bool) {
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
            let width = self.tabBar.bounds.width
            
            UIView.animateWithDuration(0.05, animations:{ () -> Void in
                self.tabBar.transform = CGAffineTransformMakeTranslation(width * 2  , 0)
                }, completion : nil)
        default:
            break
        }
        super.viewDidAppear(animated)
    }
    @IBAction func back(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func difficultyButton(sender: UIButton) {
        if( self.easyLabel.alpha != 1){
            instructionLabelOffset += 50
            aboutLabelOffset += 50
            shareLabelOffset += 50
            feedbackLabelOffset += 50
            shareStackOffset += 50
            
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.instructionLabel.transform = CGAffineTransformMakeTranslation(0, self.instructionLabelOffset)
            self.aboutLabel.transform = CGAffineTransformMakeTranslation(0, self.aboutLabelOffset)
            self.shareLabel.transform = CGAffineTransformMakeTranslation(0, self.shareLabelOffset)
            self.feedbackLabel.transform = CGAffineTransformMakeTranslation(0, self.feedbackLabelOffset)
            self.shareButtonStack.transform = CGAffineTransformMakeTranslation(0, self.shareStackOffset)
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
            
            instructionLabelOffset -= 50
            aboutLabelOffset -= 50
            shareLabelOffset -= 50
            feedbackLabelOffset -= 50
            shareStackOffset -= 50
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.easyLabel.alpha = 0
                self.mediumLabel.alpha = 0
                self.hardLabel.alpha = 0
                self.tabBar.alpha = 0
                self.tabBarBackground.alpha = 0

                }){ (Bool) -> Void in
                    
                    UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        self.instructionLabel.transform = CGAffineTransformMakeTranslation(0, self.instructionLabelOffset)
                        self.aboutLabel.transform = CGAffineTransformMakeTranslation(0, self.aboutLabelOffset)
                        self.shareLabel.transform = CGAffineTransformMakeTranslation(0, self.shareLabelOffset)
                        self.feedbackLabel.transform = CGAffineTransformMakeTranslation(0, self.feedbackLabelOffset)
                        self.shareButtonStack.transform = CGAffineTransformMakeTranslation(0, self.shareStackOffset)
                        }, completion: nil)
            }
        }

    }
    
    @IBAction func shareButton(sender: UIButton) {
        if( self.shareButtonStack.alpha != 1){
            feedbackLabelOffset += 50
            UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
 
                self.feedbackLabel.transform = CGAffineTransformMakeTranslation(0, self.feedbackLabelOffset)
                }){ (Bool) -> Void in
                    UIView.animateWithDuration(0.2, animations: { () -> Void in
                        self.shareButtonStack.alpha = 1
                    })
            }
        }else{
            feedbackLabelOffset -= 50
            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.shareButtonStack.alpha = 0
                
                }){ (Bool) -> Void in
                    
                    UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                        self.feedbackLabel.transform = CGAffineTransformMakeTranslation(0, self.feedbackLabelOffset)
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
    
    @IBAction func AboutButton(sender: UIButton) {
        getToSmallScale()
    self.performSegueWithIdentifier("showAbout", sender: nil)
    }
    
    @IBAction func InstructionButton(sender: UIButton) {
        getToSmallScale()
    self.performSegueWithIdentifier("showInstruction", sender: nil)
        
    }
     @IBAction func connectFacebook( sender: UIButton ){
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            let facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            facebookSheet.addImage(UIImage(named: "char-6.png")!)
            facebookSheet.setInitialText("Sharing an interesting iOS Game : Triple Bubble")
            facebookSheet.addURL(NSURL(string:"https://github.com/triplebubble/demo2"))
            self.presentViewController(facebookSheet, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    
    
    @IBAction func connectTwitter( sender: UIButton ){
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            let shareWithTwitter = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            shareWithTwitter.setInitialText("Sharing an interesting iOS Game : Triple Bubble")
            shareWithTwitter.addURL(NSURL(string:"https://github.com/triplebubble/demo2"))
            self.presentViewController(shareWithTwitter, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Accounts", message: "Please login to a Twitter account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func SMSBTPress(sender: AnyObject) {
        sendMessage()
    }
    
    func sendMessage() {
        let messageViewC = MFMessageComposeViewController()
        messageViewC.body = "Sharing an interesting iOS Game : Triple Bubble, check it out at: https://github.com/triplebubble/demo2"
        messageViewC.recipients = [] // Optionally add some tel numbers
        messageViewC.messageComposeDelegate = self
        // Open the SMS View controller
        presentViewController(messageViewC, animated: true, completion: nil)
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResultCancelled.rawValue :
            print("message canceled")
            
        case MessageComposeResultFailed.rawValue :
            print("message failed")
            
        case MessageComposeResultSent.rawValue :
            print("message sent")
            
        default:
            break
        }
        //self.view.hidden = true
        self.navigationController?.navigationBarHidden = true
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func EMBTPress(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients([])
        mailComposerVC.setSubject("Sharing an interesting iOS Game : Triple Bubble")
        mailComposerVC.setMessageBody("https://github.com/triplebubble/demo2", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let alert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        //self.view.hidden = true
        self.navigationController?.navigationBarHidden = true
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            NSLog("Mail Cancelled")
        case MFMailComposeResultFailed.rawValue:
            NSLog("Mail sent failure: %@",[error!.localizedDescription])
        case MFMailComposeResultSaved.rawValue:
            NSLog("Mail Saved")
        case MFMailComposeResultSent.rawValue:
            NSLog("Mail Sent")
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func feedBackButton(sender: UIButton) {
        let Subject = "Feedback for Triple Bubble"
        let toRecipients = ["huiyuanr@usc.edu"]
        let mc : MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(Subject)
        mc.setToRecipients(toRecipients)
        self.presentViewController(mc, animated: true, completion: nil)
    }
    func getToSmallScale(){
        UIView.animateWithDuration(0.3, animations: {
   
            self.view.alpha = 0.8
            self.view.transform =  CGAffineTransformConcat(CGAffineTransformMakeScale(0.9, 0.9), CGAffineTransformMakeTranslation(0, 30))})
        }
    
    func returnToNormalScale(){
        print("ani")
        UIView.animateWithDuration(0.3, animations: {
            
            self.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
            self.view.alpha = 1
            
        })
    }
    @IBAction func SwapeFromEdge(sender: UIScreenEdgePanGestureRecognizer) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showAbout"{
            let des = segue.destinationViewController as! AboutViewController
            des.beforeViewController = self
        
        }else if segue.identifier == "showInstruction"{
            let des = segue.destinationViewController as! InstructionViewController
            des.beforeViewController = self
            
        }
    }
}
