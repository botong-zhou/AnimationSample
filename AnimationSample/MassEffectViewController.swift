//
//  MassEffectViewController.swift
//  AnimationSample
//
//  Created by bin1991 on 15/8/2.
//  Copyright (c) 2015年 bin1991. All rights reserved.
//

import UIKit

class MassEffectViewController: UIViewController, UICollisionBehaviorDelegate {
    
    //定义蓝色方块
    let blueSquare = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    //创建一个长方形View
    let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 140, height: 20))
    
    //定义UIKit物理引擎
    var animator: UIDynamicAnimator!
    
    //定义重力行为
    var gravity: UIGravityBehavior!
    
    //定义碰撞行为
    var collision: UICollisionBehavior!
    
    //定义捕捉点击
    var snap: UISnapBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //加载蓝色方块
        blueSquare.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueSquare)
        //加载红色长方块
        barrier.backgroundColor = UIColor.redColor()
        self.view.addSubview(barrier)
        
        //实例化UIKit物理引擎类，作用于ViewController的View
        animator = UIDynamicAnimator(referenceView: self.view)
        
        //实例化重力行为类，目前只作用于刚才的创建的蓝色方块的View
        gravity = UIGravityBehavior(items: [blueSquare])
        
        //将重力行为添加到UIKit物理引擎类中
        animator.addBehavior(gravity)
        
        //实例化碰撞行为类，目前只作用于刚才创建的蓝色方块View
        collision = UICollisionBehavior(items: [blueSquare])
        
        //设置碰撞行为collision的碰撞代理
        collision.collisionDelegate = self
        
        //将参考视图的边界作为碰撞边界
        collision.translatesReferenceBoundsIntoBoundary = true
        //将红色方块也作为碰撞边界
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        
        //将碰撞行为添加到UIKit的物理引擎类中
        animator.addBehavior(collision)
        
        //配置蓝色方块的行为属性
        let itemBehaviour = UIDynamicItemBehavior(items: [blueSquare])
        //弹性参数
        itemBehaviour.elasticity = 0.6
        animator.addBehavior(itemBehaviour)
        
        //打印方块轨迹
//        collision.action = {
//            println("\(NSStringFromCGAffineTransform(self.blueSquare.transform)) \(NSStringFromCGPoint(self.blueSquare.center))")
//        }
        //记录方块的运动轨迹
//        var updateCount = 0;
//        collision.action = {
//            if (updateCount % 3 == 0) {
//                let outline = UIView(frame: self.blueSquare.bounds);
//                outline.transform = self.blueSquare.transform;
//                outline.center = self.blueSquare.center;
//                
//                outline.alpha = 0.5;
//                outline.backgroundColor = UIColor.clearColor();
//                outline.layer.borderColor = self.blueSquare.layer.presentationLayer().backgroundColor;
//                outline.layer.borderWidth = 1.0;
//                self.view.addSubview(outline);
//            }
//            
//            ++updateCount;
//        }
        
    }
    
    //实时碰撞的颜色改变
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint) {
        
        //打印正方形的碰撞事件
        println("Boundary contact occurred - \(identifier)")
        
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = (touches as NSSet).anyObject() as! UITouch
        snap = UISnapBehavior(item: blueSquare, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }

}
