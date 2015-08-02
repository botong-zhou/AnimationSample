//
//  RotationViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/7.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class RotationViewController: UIViewController {
    
    @IBOutlet weak var wheel: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func spin() {
        // option选项 CurveLinear是匀速的意思
        UIView.animateWithDuration(1, delay: 0, options: .CurveLinear, animations: {
            self.wheel.transform = CGAffineTransformRotate(self.wheel.transform, CGFloat(M_PI))
            }) { (finished) -> Void in
                self.spin()
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.spin()
        

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
