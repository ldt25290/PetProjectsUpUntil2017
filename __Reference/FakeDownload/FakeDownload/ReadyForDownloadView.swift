//
//  CustomView.swift
//  CoreGraphicsDrawingSample
//
//  Created by SeoGiwon on 4/23/17.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

class ReadyForDownloadView: UIView {
    
    convenience init() {
        
        let boundRect = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.init(frame:boundRect)
        self.backgroundColor = UIColor.clear
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    class func drawContents(_ context: CGContext, rect: CGRect, color:UIColor) {
        
        let boundRect = rect
        let boundCircleRect = boundRect.insetBy(dx: 1, dy: 1)
        
        // set background to clear color
        context.setFillColor(UIColor.clear.cgColor)
        context.fill(boundRect)
        
        // draw rect circle
        context.setStrokeColor(color.cgColor)
        context.addEllipse(in: boundCircleRect)
        context.strokePath()
        
        // draw arrow
        context.setLineCap(.round)
        context.move(to: CGPoint(x: boundRect.midX, y: 10))
        context.addLine(to: CGPoint(x: boundRect.midX, y: 30))
        context.move(to: CGPoint(x: boundRect.midX - 7, y: 27))
        context.addLine(to: CGPoint(x: boundRect.midX, y: 33))
        context.addLine(to: CGPoint(x: boundRect.midX + 7, y: 27))
        context.strokePath()
    }
    
 
    class func image(in color:UIColor) -> UIImage {
        
        let size = CGSize(width: 40, height: 40)
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        var newImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        
        if let context = UIGraphicsGetCurrentContext() {
            
            ReadyForDownloadView.drawContents(context, rect: rect, color: color)

            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            
            UIGraphicsEndImageContext()
            
            return newImage
            
        } else {
            fatalError()
        }
        
        
    }
        

}