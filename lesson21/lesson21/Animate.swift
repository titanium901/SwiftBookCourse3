//
//  Animate.swift
//  lesson21
//
//  Created by Yury Popov on 04/06/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

extension ViewController {
    func circleAnimate() {
       
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, options: [], animations: {
            self.backToNormal()
        }) { (_) in
            let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeIn) {
                self.viewChange.layer.cornerRadius = self.viewChange.frame.width / 2
                self.viewChange.backgroundColor = .orange
            }
            animator.startAnimation()
        }

        
    }
    
    func squareAnimate() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, options: [], animations: {
            self.backToNormal()
            self.viewChange.backgroundColor = .red
        })
    }
    
    func rhombusAnimate() {
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 2, delay: 0, options: [], animations: {
            self.backToNormal()
        }) { (_) in
            let animator = UIViewPropertyAnimator(duration: 1.5, curve: .easeIn) {
                self.viewChange.backgroundColor = .blue
                self.viewChange.transform = CGAffineTransform(a: 0.7, b: -0.6, c: 0.6, d: 0.7, tx: 0.0, ty: 0.0)
            }
            animator.startAnimation()
            
            
        }
    }
    
    func animationKeys() {
       
        let start = self.viewChange.center
        
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeCubicPaced, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                
              self.viewChange.transform = CGAffineTransform(scaleX: 2, y: 2)
              self.viewChange.backgroundColor = .blue
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.viewChange.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
                self.viewChange.backgroundColor = .black
            }
//
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
               self.viewChange.center = CGPoint(x: self.view.bounds.width, y: start.y)
               self.viewChange.backgroundColor = .green
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.viewChange.center = start
                self.viewChange.backgroundColor = .black
                
            }
        }, completion: { (_) in
            let animator = UIViewPropertyAnimator(duration: 1, curve: .easeIn) {
                self.viewChange.backgroundColor = .cyan
                self.backToNormal()
            }
            animator.startAnimation()
        })
    }
    
    func backToNormal() {
        self.viewChange.layer.cornerRadius = 0
        self.viewChange.transform = CGAffineTransform(a: 1.0, b: 0, c: 0, d: 1.0, tx: 0, ty: 0)
    }
}
