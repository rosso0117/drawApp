//
//  TestDraw.swift
//  arcPath
//
//  Created by Tomohiro Yoshida on 2016/04/06.
//  Copyright © 2016年 Tomohiro Yoshida. All rights reserved.
//

import UIKit

class Draw: UIView {
    let myAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    override func drawRect(rect: CGRect) {
//        self.layer.backgroundColor = UIColor.clearColor()
//        self.frame = rect
        let myOval = UIBezierPath(ovalInRect: rect)
            myAppDelegate.drawColor.setFill()
        UIColor.clearColor().setStroke()
        myOval.fill()
        myOval.lineWidth = 0.0
        myOval.stroke()
    }
    
}
