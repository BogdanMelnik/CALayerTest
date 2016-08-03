//
//  ViewController.swift
//  CALayerTest
//
//  Created by Bogdan Melnik on 7/4/16.
//  Copyright © 2016 Yohoho. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let l1 = CALayer()
        //let sublayerRect = CGRectMake(25,25,self.view.frame.width-50, self.view.frame.height-50)
        l1.frame = CGRectInset(self.view.layer.frame, 50, 50)
        l1.backgroundColor = UIColor.orangeColor().CGColor
        l1.cornerRadius = 35.00
        l1.shadowOffset = CGSize.init(width: 0.0, height: 1.25)
        l1.shadowRadius = CGFloat.init(20.25)
        l1.shadowColor  = UIColor.purpleColor().CGColor
        l1.shadowOpacity = Float(0.95)
        //l1.contents = UIImage.init(named: "Bundle.bundle/1.jpg")?.CGImage
        l1.borderColor = UIColor.grayColor().CGColor
        l1.borderWidth = CGFloat(10)
        self.view.layer.addSublayer(l1)
        
        let l2 = CALayer()
        l2.frame = CGRectInset(l1.frame, 5.0, 5.0)
        l2.cornerRadius = 35.00
        l2.contents = UIImage.init(named: "Bundle.bundle/1.jpg")!.CGImage
        l2.masksToBounds = true
        self.view.layer.addSublayer(l2)
        
        let l3 = CALayer()
        l3.delegate = self
        l3.backgroundColor = UIColor.greenColor().CGColor
        l3.frame = CGRectInset(self.view.layer.frame, 100, 100)
        l3.shadowOffset = CGSize.init(width: 0.0, height: 3.0)
        l3.shadowRadius = 5.0
        l3.shadowColor = UIColor.blackColor().CGColor
        l3.shadowOpacity = 0.8
        l3.cornerRadius = 10.0
        l3.borderColor = UIColor.blackColor().CGColor
        l3.borderWidth = 3.0
        l3.masksToBounds = true
        self.view.layer.addSublayer(l3)
        l3.setNeedsDisplay()
        
//        for layer in self.view.layer.sublayers! {
//            if (layer === sublayer) {
//                print(layer)
//                //layer.removeFromSuperlayer()
//            }
//        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension Int {
    var degreesToRadians: Double { return Double(self) * M_PI / 180 }
    var radiansToDegrees: Double { return Double(self) * 180 / M_PI }
}

protocol DoubleConvertible {
    init(_ double: Double)
    var double: Double { get }
}

extension Double : DoubleConvertible {
    var double: Double { return self }
}

extension Float  : DoubleConvertible {
    var double: Double { return Double(self) }
}

extension CGFloat: DoubleConvertible {
    var double: Double { return Double(self)
    }
}

extension DoubleConvertible {
    var degreesToRadians: DoubleConvertible {
        return Self(double * M_PI / 180)
    }
    var radiansToDegrees: DoubleConvertible {
        return Self(double * 180 / M_PI)
    }
}
