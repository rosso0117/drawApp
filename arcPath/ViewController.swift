//
//  ViewController.swift
//  arcPath
//
//  Created by Tomohiro Yoshida on 2016/04/06.
//  Copyright © 2016年 Tomohiro Yoshida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let myAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        DrawColorViewController().setDrawColor()
        BackGrounColorViewController().setBGColor()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchedView(_:)))
//        self.view.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(touchedView(_:)))
        self.view.addGestureRecognizer(panGesture)
//        let mySegmentedControl = UISegmentedControl(items: ["View", "BGColor", "DrawColor"])
//        mySegmentedControl.layer.position = CGPointMake(self.view.frame.midX,
//                                                        self.view.frame.maxY - 100)
//        self.view.addSubview(mySegmentedControl)
//        
//        
//        var myBtn = UIButton()
//        myBtn.frame = CGRectMake(0, 0, 40, 20)
//        myBtn.center = CGPoint(x: self.view.center.x, y: self.view.frame.maxY - 100.0)
//        myBtn.backgroundColor = UIColor.cyanColor()
//        myBtn.addTarget(self, action: #selector(changedValue(_:)), forControlEvents: .TouchUpInside)
//        self.view.addSubview(myBtn)
    }
    
    func touchedView(sender: UITapGestureRecognizer) {
        let myRectX = CGFloat(arc4random_uniform(UInt32(40)))
        let myRectY = CGFloat(arc4random_uniform(UInt32(40)))
        let myRectWidthHeight = arc4random_uniform(UInt32(25) + 5)
        let myDrawView = Draw()
        myDrawView.frame = CGRectMake(0, 0,
        CGFloat(myRectWidthHeight), CGFloat(myRectWidthHeight))
        myDrawView.layer.position = CGPoint(x: sender.locationInView(self.view).x + myRectX,
                                            y: sender.locationInView(self.view).y + myRectY)
        myDrawView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(myDrawView)
    }
    
//    func getImage() -> UIImage {
//        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width,
//                          height: self.view.bounds.height - myAppDelegate.myTabBarHeight)
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 1.0)
//        let context = UIGraphicsGetCurrentContext()!
//        
//        self.view.layer.renderInContext(context)
//        let capturedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return capturedImage
//    }
//

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

