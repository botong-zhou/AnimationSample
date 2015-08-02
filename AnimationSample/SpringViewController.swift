//
//  SpringViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/8.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class SpringViewController: UIViewController {

    @IBOutlet weak var greenSquare: UIView!
    @IBOutlet weak var redSquare: UIView!
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
            
            self.greenSquare.center.x = self.view.bounds.width - self.greenSquare.center.x
            
        })
        // Damping阻尼取值范围0～1; Velocityz初速度
        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.0, options: nil, animations:{
            
            self.redSquare.center.x = self.view.bounds.width - self.redSquare.center.x
            
        }, completion: nil)
        
        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: nil, animations:{
            
            self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            
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
