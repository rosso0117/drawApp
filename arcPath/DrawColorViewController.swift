//
//  BGColorViewController.swift
//  arcPath
//
//  Created by Tomohiro Yoshida on 2016/04/08.
//  Copyright © 2016年 Tomohiro Yoshida. All rights reserved.
//

import UIKit

class DrawColorViewController: UIViewController {
    let myAppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var hsvSliderArray: [UISlider]!

    override func viewDidLoad() {
        super.viewDidLoad()

        hsvSliderArray = []
               // Do any additional setup after loading the view.
        for i in 0 ... 3 {
            let slider = UISlider()
            slider.frame = CGRectMake(0, 0, self.view.bounds.width / 3, 30)
            slider.layer.position = CGPoint(x: self.view.bounds.width * 1 / 4,
                                            y: self.view.bounds.height * 5 / 8 +  CGFloat(40 * i))
            slider.minimumValue = 0.0
            slider.maximumValue = 1.0
            slider.value = 0.5
            slider.tag = i
            slider.addTarget(self, action: #selector(changeBackGroundColor),
                forControlEvents: UIControlEvents.ValueChanged)
            hsvSliderArray.append(slider)
            self.view.addSubview(hsvSliderArray[i])
        }
        
        for i in 0 ..< hsvSliderArray.count {
            changeBackGroundColor(i, value: CGFloat(hsvSliderArray[i].value))
        }
        
        let clearBtn = UIButton()
        clearBtn.frame = CGRectMake(0, 0, 60, 40)
        clearBtn.layer.position = CGPoint(x: self.view.frame.maxX - 60,
                                          y: self.hsvSliderArray[3].frame.midY)
        clearBtn.layer.masksToBounds = true
        clearBtn.layer.cornerRadius = 2.0
        clearBtn.setTitle("Clear", forState: .Normal)
        clearBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        clearBtn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        clearBtn.backgroundColor = UIColor.clearColor()
        clearBtn.tintColor = UIColor.whiteColor()
        clearBtn.addTarget(self, action: #selector(clearBtnPushed(_:)),
                           forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(clearBtn)
    }
    
    func changedValue(sender: UISlider) -> CGFloat {
            return CGFloat(sender.value)
    }
    
    func changeBackGroundColor(tag: Int, value: CGFloat) {
        self.view.backgroundColor = UIColor(hue: changedValue(hsvSliderArray[0]),
                                            saturation: changedValue(hsvSliderArray[1]), brightness: changedValue(hsvSliderArray[2]), alpha: changedValue(hsvSliderArray[3]))
        setDrawColor()
    }
    
//    このビューのバックグランドカラーをApp全体の変数に代入
    func setDrawColor() {
        myAppDelegate.drawColor = self.view.backgroundColor
    }
    
    //        ViewController上に描かれた全てのViewを取り除く
    func clearBtnPushed(sender: UIButton) {
        for subview in myAppDelegate.myFirstTab.view.subviews {
            subview.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
