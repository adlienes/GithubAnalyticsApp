//
//  ButtonAnim.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 20.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func Banimation() {
        let animasyon=CASpringAnimation(keyPath: "transform.scale")
        animasyon.duration=0.6
        animasyon.fromValue=0.95
        animasyon.toValue=1.0
        animasyon.autoreverses=true
        animasyon.repeatCount=2
        animasyon.initialVelocity=0.5
        animasyon.damping=1.0
        
        layer.add(animasyon, forKey: nil)
        
    }
}
