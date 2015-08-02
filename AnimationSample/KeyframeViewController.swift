//
//  KeyframeViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/31.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class KeyframeViewController: UIViewController {
    
    
    @IBOutlet weak var blueSquare: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateKeyframesWithDuration(2, delay: 0, options: nil, animations: {
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
            UIView.addKeyframeWithRelativeStartTime(0.5, relativeDuration: 0.25, animations: {
                self.blueSquare.center.x = self.view.bounds.width - self.blueSquare.center.x
            })
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: {
                self.blueSquare.center.y = self.view.bounds.height - self.blueSquare.center.y
            })
            }, completion: nil)
    }

}
