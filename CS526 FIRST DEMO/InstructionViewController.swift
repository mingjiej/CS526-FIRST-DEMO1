//
//  InstructionViewController.swift
//  Triple Bubbles
//
//  Created by Huiyuan Ren on 16/2/10.
//  Copyright © 2016年 User. All rights reserved.
//

import UIKit

class InstructionViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var beforeViewController : SettingView? = nil
    var pageViewController : UIPageViewController!
    var InstructionArray : NSMutableArray = ["uiground_1.jpg", "DiamondRed.png"]

    @IBOutlet weak var backGround: UIImageView!
    
    override func viewDidLoad() {
        self.view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.8, 0.8), CGAffineTransformMakeTranslation(0, 100))
        self.view.alpha = 0
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InsPageViewController") as! UIPageViewController
        
        let initialContenViewController = viewControllerAtIndex(0) as InstructionViewControllerContent
        
        let viewControllers = NSArray(object: initialContenViewController)
        
        
        self.pageViewController.setViewControllers((viewControllers as! [InstructionViewControllerContent]), direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        
        self.pageViewController.dataSource = self
        self.pageViewController.delegate = self
        
        self.pageViewController.view.frame = CGRectMake(backGround.frame.minX + 20, backGround.frame.minY + 40 , backGround.frame.size.width - 40, backGround.frame.size.height - 60 )
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)

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
    
    func viewControllerAtIndex(index : Int ) -> InstructionViewControllerContent {
        if(self.InstructionArray.count == 0 || index >= self.InstructionArray.count){
            return InstructionViewControllerContent()
        }else{
            let vc: InstructionViewControllerContent = self.storyboard?.instantiateViewControllerWithIdentifier("InsPageViewControllerContent") as! InstructionViewControllerContent
            vc.totalPage = InstructionArray.count
            vc.pageIndex = index
            vc.imageFile = InstructionArray[index] as! String
            vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            return vc
        }
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?{
        
        let vc = viewController as! InstructionViewControllerContent
        var index = vc.pageIndex as Int
        if( index == NSNotFound){
            return nil
        }else if(index == 0){
            return nil
        }
        else{
            return viewControllerAtIndex(--index)
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.InstructionArray.count
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?{
        let vc = viewController as! InstructionViewControllerContent
        var index = vc.pageIndex as Int
        if(  index == NSNotFound){
            return nil
        }else if (index >= (self.InstructionArray.count - 1)){
            return nil
        }else{
            return viewControllerAtIndex(++index)
        }
        
    }
    
    func currentPage(pageViewController: UIPageViewController) -> Int{
        let pageContentViewController = pageViewController.viewControllers![0] as! InstructionViewControllerContent
        let index = pageContentViewController.pageIndex
        return index
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if(completed == true){
            let index = currentPage(pageViewController)
            switch index {
            case 0:
                break;
            case 1:
                break
                
            case 2:
       
                break
            default:
                break
                
            }
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
