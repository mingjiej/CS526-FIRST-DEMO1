//
//  InstructionViewControllerContent.swift
//  Triple Bubbles
//
//  Created by Huiyuan Ren on 16/2/10.
//  Copyright © 2016年 User. All rights reserved.
//

import UIKit

class InstructionViewControllerContent: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var totalPage = 0
    var pageIndex = 0
    var imageFile = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named:imageFile)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
