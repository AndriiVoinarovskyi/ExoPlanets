//
//  OrbitView.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.26.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

class OrbitView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var eccentricity : CGFloat = CGFloat()
    
    override func draw(_ rect: CGRect) {
        print("Start Draw")
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            print("I Could not Draw!")
            return
        }
        
        
        drawEllipse(using: currentContext)
    }

    func drawOrbit(eccentricity: Double) {
        setNeedsDisplay()
        self.eccentricity = CGFloat(eccentricity)
    }
    
    func drawEllipse(using context: CGContext) {
        
        let side : CGFloat = bounds.size.width - 10
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        
        print("Width = \(bounds.size.width)")
        print("Height = \(bounds.size.height)")
        print("center = \(center)")
        
//        let ll = CGPoint(x: center.x - side / 2, y: center.y + side / 2)
//        let lr = CGPoint(x: center.x + side / 2, y: center.y + side / 2)
//        let ur = CGPoint(x: center.x + side / 2, y: center.y - side / 2)
//        let ul = CGPoint(x: center.x - side / 2, y: center.y - side / 2)
        
        
//        context.move(to: ll)
//        context.addLine(to: lr)
//        context.addLine(to: ur)
//        context.addLine(to: ul)
//        context.addLine(to: ll)
        
        
        
        
        let rect = CGRect(x: center.x - side / 2, y: center.y - side * (1 - eccentricity) / 2, width: side, height: side * (1 - eccentricity))
        
        context.addEllipse(in: rect)
        context.setLineCap(.round)
        context.setLineWidth(2.0)
        context.setStrokeColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        context.strokePath()
        

    }

}
