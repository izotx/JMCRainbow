/**JMCRainbow 

    Copyright  by Janusz Chudzynski
    Website:izotx.com
    Email: janusz@izotx.com 

    UIImage Extensionthat can be used to generate the rainbow uiimage based on hue.
    Extension to UIView to produce rainbow background to anything and everything
    
    Feel free to use in your projects as long as you keep my contact information.

*/

import UIKit
import CoreImage

extension UIImage{
    
    /**
    size: target size of the image
    segments: number of segments in the hue
    */
    
    static func generateRainbow(size:CGSize, segments:Int)->UIImage?{
        let segmentWidth = size.width / CGFloat(segments)
        
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()
        
        for var i:Int = 0; i < segments; i = i+1{
            //generate color
            let currentHue = CGFloat(i)/CGFloat(segments)
            let color =  UIColor(hue: currentHue, saturation: 1, brightness: 1, alpha: 1.0)
            //current x offset
            let currentx:CGFloat = size.width * CGFloat(i) / CGFloat(segments)
            
            CGContextSetFillColorWithColor(context, color.CGColor)
            CGContextFillRect(context, CGRectMake(currentx, 0, segmentWidth, size.height))
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image
    }

//    static func  generateRainbowWithCoreImage(size:CGSize,segments:Int)->UIImage?{
//        
//        UIGraphicsBeginImageContext(size)
//        let context = UIGraphicsGetCurrentContext()
//        let segmentWidth = size.width / CGFloat(segments)
//        for var i:Int = 0; i < segments; i = i+1{
//            
//    //        let current = CGFloat(min) + max * CGFloat(i)/CGFloat(segments);
//            
//            //generate color
//            let currentHue = CGFloat(i)/CGFloat(segments)
//            let color =  UIColor(hue: currentHue, saturation: 1, brightness: 1, alpha: 1.0)
//            //current x offset
//            let currentx:CGFloat = size.width * CGFloat(i) / CGFloat(segments)
//            
//            CGContextSetFillColorWithColor(context, color.CGColor)
//            CGContextFillRect(context, CGRectMake(currentx, 0, segmentWidth, size.height))
//        }
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//        
//        UIGraphicsEndImageContext()
//        return image
//    }
    
    
    
}

//
//let filter = CIFilter(name: "CIHueAdjust")
//print(filter!.attributes())



extension UIView{
    func rainbowBackground(){
        self.backgroundColor = UIColor(patternImage: UIImage.generateRainbow(self.frame.size, segments: 1000)!)
    }
}


/*Example of using it in your code*/
let v = UIView(frame: CGRectMake(0, 0, 1000, 1000))
v.rainbowBackground()

let slider = UISlider(frame: CGRectMake(0, 0, 100, 40))
//slider.rainbowBackground()
let rainbow = UIImage.generateRainbow(CGSizeMake(slider.frame.width, 2), segments: 1000)!.stretchableImageWithLeftCapWidth(3, topCapHeight: 0)


slider.setMinimumTrackImage(rainbow, forState: UIControlState.Normal)
slider.setMaximumTrackImage(rainbow, forState: UIControlState.Normal)



if let image = UIImage.generateRainbow(CGSizeMake(320,600), segments: 2000){
  image

}



