//
//  ViewController.swift
//  CoreAnimationSampleApp
//
//  Created by Hamid Hoseini on 10/24/20.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {

    
    let layer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.animateMovement()
            self.animateOpacity()
            self.rotate()
        }
    
    }
    
    func rotate() {
        //let animation = CABasicAnimation(keyPath: "position")
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.duration = 1
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        //layer.add(animation, forKey: nil)
        
    }

    func animateMovement() {
        //let animation = CABasicAnimation(keyPath: "position")
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + (layer.frame.size.width/2),
                                      y: layer.frame.origin.y + (layer.frame.size.height/2))
        animation.toValue = CGPoint(x: 300, y: 300)
        animation.duration = 1
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        //layer.add(animation, forKey: nil)
        
    }
    
    func animateOpacity() {
        //let animation = CABasicAnimation(keyPath: "opacity")
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        //animation.timingFunction =
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
        //layer.add(animation, forKey: nil)
        
    }
}

