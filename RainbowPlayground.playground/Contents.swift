/**JMCRainbow 

    Copyright  by Janusz Chudzynski
    Website:izotx.com
    Email: janusz@izotx.com 

    UIKit Method that can be used to generate the rainbow uiimage based on hue
    Extension to UIView to produce rainbow background to anything and everything
    
    Feel free to use in your projects as long as you keep my contact information.

*/

import UIKit

extension UIImage{
    
    /**
    size: target size of the image
    segments: number of segments in the hue
    */
    
    static func generateRainbow(size:CGSize, segments:Int)->UIImage{
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
}



extension UIView{
    func rainbowBackground(){
        self.backgroundColor = UIColor(patternImage: UIImage.generateRainbow(self.frame.size, segments: 1000))
    }
}


/*Example of using it in your code*/
let v = UIView(frame: CGRectMake(0, 0, 1000, 1000))
v.rainbowBackground()

let slider = UISlider(frame: CGRectMake(0, 0, 100, 10))
//slider.rainbowBackground()
let rainbow = UIImage.generateRainbow(CGSizeMake(slider.frame.width, 2), segments: 1000).stretchableImageWithLeftCapWidth(7, topCapHeight: 0)


slider.setMinimumTrackImage(rainbow, forState: UIControlState.Normal)
slider.setMaximumTrackImage(rainbow, forState: UIControlState.Normal)


