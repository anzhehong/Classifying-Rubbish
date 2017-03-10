//
//  CRUtils.swift
//  Swift Tips Learn
//
//  Created by An, Fowafolo on 3/7/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit

public class CRUtils: NSObject {
    
    public class func addAllAroundConstraints(_ targetView: UIView, containerView: UIView) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: targetView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: containerView,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 0)
        let bottom = NSLayoutConstraint(item: targetView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: containerView,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0)
        let leading = NSLayoutConstraint(item: targetView,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: containerView,
                                         attribute: .leading,
                                         multiplier: 1.0,
                                         constant: 0)
        let trailing = NSLayoutConstraint(item: targetView,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: containerView,
                                          attribute: .trailing,
                                          multiplier: 1.0,
                                          constant: 0)
        containerView.addConstraints([top, bottom, leading, trailing])
    }
    
    public class func addAllCenterConstraints(_ targetView: UIView, containerView: UIView) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        let centerX = NSLayoutConstraint(item: targetView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: containerView,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0)
        let centerY = NSLayoutConstraint(item: targetView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: containerView,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: 0)
        
        containerView.addConstraints([centerX, centerY])
    }
    
    public class func addTopAndBottomConstraints(_ targetView: UIView, containerView: UIView) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: targetView,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: containerView,
                                     attribute: .top,
                                     multiplier: 1.0,
                                     constant: 0)
        let bottom = NSLayoutConstraint(item: targetView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: containerView,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 0)
        containerView.addConstraints([top, bottom])
    }
    
    public class func shakeView(_ view: UIView) {
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x");
        translation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        translation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0]
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = [-5, 5, -5, 5, -3, 3, -2, 2, 0].map {
            (degrees: Double) -> Double in
            let radians: Double = (M_PI * degrees) / 180.0
            return radians
        }
        
        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = 1
        shakeGroup.repeatCount = 2
        view.layer.add(shakeGroup, forKey: "shakeIt")
    }
    
    public class func showSpringAnim(view viewToAnimate: UIView) {
        let originFrame = viewToAnimate.frame
        let duration: TimeInterval = 3
        let delay: TimeInterval = 0
        let damping: CGFloat = 0.35
        let velocity: CGFloat = 0
        let options: UIViewAnimationOptions = UIViewAnimationOptions.curveEaseInOut
        let animations: () -> Void = {() -> Void in
            viewToAnimate.transform = CGAffineTransform.init(scaleX: 2, y: 2)
            viewToAnimate.transform = CGAffineTransform(translationX: -originFrame.width / 2, y: -originFrame.height * 2)
        }
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: animations) { (finish) in
            print("rubbish popped up")
        }
    }
}
