//
//  EasingViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/8.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class EasingViewController: UIViewController {
    
    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var redSquare: UIView!
    @IBOutlet weak var blueSquare: UIView!
    @IBOutlet weak var yellowSquare: UIView!
    

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
            
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            
        })
        
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseIn, animations: {
            
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseOut, animations: {
            
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            
            }, completion: nil)
        
        UIView.animateWithDuration(1, delay: 0, options: .CurveEaseInOut, animations: {
            
            self.yellowSquare.center.x = self.view.bounds.width - self.yellowSquare.center.x
            
            }, completion: nil)
        
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
