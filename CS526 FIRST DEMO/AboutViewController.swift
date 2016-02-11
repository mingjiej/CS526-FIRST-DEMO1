//
//  AboutViewController.swift
//  Triple Bubbles
//
//  Created by Huiyuan Ren on 16/2/10.
//  Copyright © 2016年 User. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //
    //  AboutViewController.swift
    //  Triple Bubbles
    //
    //  Created by Huiyuan Ren on 16/2/10.
    //  Copyright © 2016年 User. All rights reserved.
    //

        
        var beforeViewController : SettingView? = nil
        
        override func viewDidLoad() {
            self.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.8, 0.8), CGAffineTransformMakeTranslation(0, 100))
            self.view.alpha = 0
            
        }
        override func viewWillAppear(animated: Bool) {
            UIView.animateWithDuration(0.1, animations: {
                self.view.alpha = 1})
            UIView.animateWithDuration(0.3, animations: {
                self.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeTranslation(0, 0))
                //            self.PerksView.transform = CGAffineTransformMakeTranslation(0, 0)
                
            })
        }
        
        @IBAction func close(sender: UIButton) {
            UIView.animateWithDuration(0.1) { () -> Void in
                self.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.8, 0.8), CGAffineTransformMakeTranslation(0, 100))
                self.view.alpha = 0
            }
            self.beforeViewController!.returnToNormalScale()
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
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
