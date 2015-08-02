//
//  LoginViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/7/24.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class SpecialLoginView: UIViewController, UICollisionBehaviorDelegate {
    
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
    
    //物理效果
    //定义UIKit物理引擎
    var animator: UIDynamicAnimator!
    
    //定义重力行为
    var gravity: UIGravityBehavior!
    
    //定义碰撞行为
    var collision: UICollisionBehavior!
    
    //捕捉触摸点击位置
    var snap: UISnapBehavior!
    
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
        username.resignFirstResponder()
        password.resignFirstResponder()
        
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
                                    }, completion: { _ in
                                        
                                        //实例化UIKit物理引擎类，作用于ViewController的View
                                        self.animator = UIDynamicAnimator(referenceView: self.view)
                                        
                                        //实例化重力行为类，作用于所有View
                                        self.gravity = UIGravityBehavior(items: [
                                            self.dot,
                                            self.logo,
                                            self.username,
                                            self.password,
                                            self.login,
                                            self.warningMessage
                                            ])
                                        
                                        //将重力行为添加到UIKit物理引擎类中
                                        self.animator.addBehavior(self.gravity)
                                        
                                        //实例化碰撞行为类，作用于所有
                                        self.collision = UICollisionBehavior(items: [
                                            self.dot,
                                            self.logo,
                                            self.username,
                                            self.password,
                                            self.login,
                                            self.warningMessage
                                            ])
                                        
                                        //设置碰撞行为collision的碰撞代理
                                        self.collision.collisionDelegate = self
                                        
                                        //将参考视图的边界作为碰撞边界
                                        self.collision.translatesReferenceBoundsIntoBoundary = true
                                        
                                        //将碰撞行为添加到UIKit的物理引擎类中
                                        self.animator.addBehavior(self.collision)
                                        
                                        //配置所有控件的行为属性
                                        let itemBehaviour = UIDynamicItemBehavior(items: [
                                            self.dot,
                                            self.logo,
                                            self.username,
                                            self.password,
                                            self.login,
                                            self.warningMessage
                                            ])
                                        //弹性参数
                                        itemBehaviour.elasticity = 1
                                        self.animator.addBehavior(itemBehaviour)

                                })
                        })
                })
        })
    }
  
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent?) {
        // 触发全局点击事件，使当前焦点位置失去焦点
        username.resignFirstResponder()
        password.resignFirstResponder()
        
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = (touches as NSSet).anyObject() as! UITouch
        snap = UISnapBehavior(item: login, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }

}
