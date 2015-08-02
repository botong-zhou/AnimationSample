//
//  LoginViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/24.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buble1: UIImageView!
    @IBOutlet weak var buble2: UIImageView!
    @IBOutlet weak var buble3: UIImageView!
    @IBOutlet weak var buble4: UIImageView!
    @IBOutlet weak var buble5: UIImageView!
    @IBOutlet weak var dot: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    // Custom
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    var loginPosition = CGPoint.zeroPoint
    let warningMessage = UIImageView(image: UIImage(named: "warning"))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buble1.transform = CGAffineTransformMakeScale(0, 0)
        self.buble2.transform = CGAffineTransformMakeScale(0, 0)
        self.buble3.transform = CGAffineTransformMakeScale(0, 0)
        self.buble4.transform = CGAffineTransformMakeScale(0, 0)
        self.buble5.transform = CGAffineTransformMakeScale(0, 0)
        
        self.dot.center.x -= self.view.bounds.width
        self.logo.center.x -= self.view.bounds.width
        
        // adjust place holder text
        let userPaddingView = UIView(frame: CGRectMake(0, 0, 44, self.username.frame.height))
        self.username.leftView = userPaddingView
        self.username.leftViewMode = .Always
        let passPaddingView = UIView(frame: CGRectMake(0, 0, 44, self.password.frame.height))
        self.password.leftView = passPaddingView
        self.password.leftViewMode = .Always
        
        var userImageView = UIImageView(image: UIImage(named: "user"))
        userImageView.frame.origin = CGPoint(x: 13, y: 10)
        self.username.addSubview(userImageView)
        
        var passImageView = UIImageView(image: UIImage(named: "key"))
        passImageView.frame.origin = CGPoint(x: 12, y: 9)
        self.password.addSubview(passImageView)
        
        self.username.center.x -= self.view.bounds.width
        self.password.center.x -= self.view.bounds.width
        
        self.loginPosition = self.login.center
        self.login.center.x -= self.view.bounds.width
        
        self.view.addSubview(self.warningMessage)
        self.warningMessage.center = self.loginPosition
        self.warningMessage.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buble1.transform = CGAffineTransformMakeScale(1, 1)
            self.buble2.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buble3.transform = CGAffineTransformMakeScale(1, 1)
            self.buble4.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.buble5.transform = CGAffineTransformMakeScale(1, 1)
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.logo.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(4, delay: 0.4, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.dot.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.username.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.6, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.password.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.4, delay: 0.7, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.login.center.x += self.view.bounds.width
            }, completion: nil)
    }
    
    @IBAction func loginTapped(sender: AnyObject) {
        self.login.addSubview(self.spinner)
        self.spinner.frame.origin = CGPointMake(12, 12)
        self.spinner.startAnimating()
        
        UIView.transitionWithView(self.warningMessage,
            duration: 0.3,
            options: .TransitionFlipFromTop,
            animations: {
                self.warningMessage.hidden = true
            }, completion: nil)
        
        UIView.animateWithDuration(0.3, animations: {
            self.login.center = self.loginPosition
            }, completion: { _ in
                self.login.center.x -= 30
                UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: nil, animations: {
                    self.login.center.x += 30
                    }, completion: {finished in
                        UIView.animateWithDuration(0.3, animations: {
                            self.login.center.y += 90
                            self.spinner.removeFromSuperview()
                            }, completion: { _ in
                                UIView.transitionWithView(self.warningMessage,
                                    duration: 0.3,
                                    options: .TransitionFlipFromTop | .CurveEaseOut,
                                    animations: {
                                        self.warningMessage.hidden = false
                                    }, completion: nil)
                        })
                })
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
