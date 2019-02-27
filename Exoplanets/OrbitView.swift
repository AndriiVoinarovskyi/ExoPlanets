//
//  OrbitView.swift
//  Exoplanets
//
//  Created by Macbook Pro 13 on 02.26.19.
//  Copyright © 2019 My Company. All rights reserved.
//

import UIKit

extension FloatingPoint {
    var degreeToRadians : Self { return self * .pi / 180 }
}

class OrbitView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var eccentricity : Double? = Double()
    var eccentricityCGFloat : CGFloat = CGFloat()
    
    override func draw(_ rect: CGRect) {
        print("Start Draw")
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            print("I Could not Draw!")
            return
        }
        
        drawBackgroundStars(using: currentContext)
        drawStar(using: currentContext)
        
        if self.eccentricity != nil {
            self.eccentricityCGFloat = CGFloat(eccentricity!)
            drawEllipse(using: currentContext)
        } else {
            drawWarning(using: currentContext)
        }
    }

    func drawOrbit(eccentricity: Double?) {
        setNeedsDisplay()
        self.eccentricity = eccentricity
    }
    
    func randomPoint(using context: CGContext) -> CGPoint {
        let point = CGPoint(x: CGFloat.random(in: 0...bounds.size.width), y: CGFloat.random(in: 0...bounds.size.height))
        return point
    }
    
    func drawBackgroundStars(using context: CGContext) {
        let number = Int.random(in: 100...1000)
        for _ in 0...number {
            context.addArc(center: randomPoint(using: context), radius: CGFloat.random(in: 0.5...1.5), startAngle: CGFloat(0).degreeToRadians, endAngle: CGFloat(360).degreeToRadians, clockwise: false)
            context.setLineCap(.round)
            context.setFillColor(red: CGFloat.random(in: 0.7...1), green: CGFloat.random(in: 0.7...1), blue: CGFloat.random(in: 0.7...1), alpha: CGFloat.random(in: 0...1))
            context.fillPath()
        }
    }
    
    func drawStar (using context: CGContext) {
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        context.addArc(center: center, radius: 10.0, startAngle: CGFloat(0).degreeToRadians, endAngle: CGFloat(360).degreeToRadians, clockwise: false)
        context.setLineCap(.round)
        context.setFillColor(#colorLiteral(red: 1, green: 0.8298398852, blue: 0.2543682456, alpha: 1))
        context.fillPath()
    }

    
    func drawEllipse(using context: CGContext) {
        
        var minSide : CGFloat
        if bounds.size.width < bounds.size.height {
            minSide = bounds.size.width
        } else {
            minSide = bounds.size.height
        }
        let side : CGFloat = minSide - 20
        let center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2)
        
        let rect = CGRect(x: center.x - side / 2, y: center.y - side * (1 - eccentricityCGFloat) / 2, width: side, height: side * (1 - eccentricityCGFloat))
        
        context.addEllipse(in: rect)
        context.setLineCap(.round)
        context.setLineWidth(2.0)
        context.setStrokeColor(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        context.strokePath()
    }
    
    func drawWarning(using context: CGContext) {
        let text: NSString = "Warning!\nWe haven't data about orbit."
        let side : CGFloat = bounds.size.width - 20
        let rect = CGRect(x: 20, y: 20, width: side, height: 100)
        let attr = [NSAttributedString.Key.font : UIFont.init(name: "Futura", size: 24)!,
                    NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 0.667937696, blue: 0.4736554623, alpha: 1)] as [NSAttributedString.Key : Any]

        text.draw(in: rect, withAttributes: attr as [NSAttributedString.Key : Any])
    }
}
