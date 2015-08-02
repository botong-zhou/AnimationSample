//
//  ScaleViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/7.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {
    
    
    @IBOutlet weak var blueSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(1, animations: {
            
            self.blueSquare.transform = CGAffineTransformMakeScale(2.0, 2.0)
        })
        
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
