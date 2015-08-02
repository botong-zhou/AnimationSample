//
//  ColorViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/7.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var blueSquare: UIView!
    
    @IBOutlet weak var nameText: UILabel!

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
            
            self.blueSquare.backgroundColor = UIColor.redColor()
            
            self.nameText.textColor = UIColor.whiteColor()
        
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
