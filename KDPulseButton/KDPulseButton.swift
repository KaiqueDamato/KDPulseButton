//
//  KDPulseButton.swift
//  KDPulseButton
//
//  Created by Kaique Damato on 2/1/17.
//  Copyright © 2017 Kaique Damato. All rights reserved.
//

import UIKit

@IBDesignable class KDPulseButton: UIButton {
    
    private var pulse = CAShapeLayer()
    private var mainLayer = CAShapeLayer()
    
    private var animationGroup = CAAnimationGroup()
    
    @IBInspectable var pulseColor: UIColor = UIColor.gray

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var buttonColor: UIColor {
        get {
            return UIColor(cgColor: layer.backgroundColor ?? UIColor.white.cgColor)
        }
        
        set {
            layer.backgroundColor = newValue.cgColor
        }
    }
    
    @IBInspectable var pulseDuration: CGFloat = 0.5
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setup()
        createAnimationGroup()
    }
    
    func setup() {
        mainLayer.backgroundColor = buttonColor.cgColor
        mainLayer.bounds = self.bounds
        mainLayer.cornerRadius = cornerRadius
        mainLayer.position = CGPoint(x: frame.width/2, y: frame.height/2)
        mainLayer.zPosition = -1
        
        self.layer.addSublayer(mainLayer)
        
        pulse.backgroundColor = pulseColor.cgColor
        pulse.contentsScale = UIScreen.main.scale
        pulse.bounds = self.bounds
        pulse.cornerRadius = cornerRadius
        pulse.position = CGPoint(x: frame.width/2, y: frame.height/2)
        pulse.zPosition = -2
        pulse.opacity = 0

        self.layer.insertSublayer(pulse, below: self.mainLayer)
    }
    
    func createAnimationGroup() {
        animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
        animationGroup.duration = CFTimeInterval(pulseDuration)
        
        pulse.add(animationGroup, forKey: "pulse")
    }
    
    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
    
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 1.3
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.values = [0.8, 0.4, 0]
        opacityAnimation.keyTimes = [0, 0.5, 1]
        opacityAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return opacityAnimation
    }

}
