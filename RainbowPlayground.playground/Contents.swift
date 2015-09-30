/**Rainbow created by Janusz Chudzynski
    UIKit Method that can be used to generate the rainbow uiimage based on hue
    Extension to UIView to produce rainbow background to anything and everything
*/

import UIKit

/**
    size: target size of the image
    segments: number of segments in the hue
*/
func generateRainbow(size:CGSize, segments:Int)->UIImage{

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


generateRainbow(CGSizeMake(600, 100),1000)


extension UIView{
    func rainbowBackground(){
       self.backgroundColor = UIColor(patternImage: generateRainbow(self.frame.size, 1000))
    }

}

let v = UIView(frame: CGRectMake(0, 0, 1000, 1000))
v.rainbowBackground()




