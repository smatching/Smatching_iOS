//
//  UIViewController+extensions.swift
//  iOS-Smatching
//
//  Created by shineeseo on 2018. 12. 15..
//  Copyright © 2018년 shineeseo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func isObjectNotNil(object:AnyObject!) -> Bool
    {
        if let _:AnyObject = object
        {
            return true
        }
        
        return false
    }
    
    func simpleAlert(_ title: String, _ msg: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: completion)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    
    //optional인 string을 받아서 optional 해제해서 다시 리턴함. (guard 사용)
    func gsno(_ value:String?) -> String{
        guard let value_ = value else {
            return ""
        }
        return value_
    }//func gsno
    
    func gino(_ value:Int?) -> Int{
        guard let value_ = value else {
            return 0
        }
        return value_
    }//func gino
    
    func gbno(_ value:Bool?) -> Bool{
        guard let value_ = value else {
            return false
        }
        return value_
    }//func gbno
    
    func gfno(_ value:Float?) -> Float{
        guard let value_ = value else{
            return 0
        }
        return value_
    }//func gfno
    
}
