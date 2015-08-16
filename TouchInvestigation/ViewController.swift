import UIKit

class ViewController: UIViewController {
    
    var originalX : CGFloat!
    var originalY : CGFloat!
    var frameHeight : CGFloat!
    var frameWidth : CGFloat!
    var originalCenter : CGPoint!
    
    var containerView = UIView()
    
    var button : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalX      = self.view.frame.origin.x
        originalY      = self.view.frame.origin.y
        frameHeight    = self.view.frame.height
        frameWidth     = self.view.frame.width
        originalCenter = self.view.center
        
        containerView.userInteractionEnabled = true
        containerView.frame = CGRectMake(frameWidth, originalY, 150, frameHeight)
        containerView.backgroundColor = UIColor.magentaColor()
        containerView.clipsToBounds = false
        
        var button = UIButton(frame: CGRectMake(200, 25, 100, 100))
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "foo", forControlEvents: .TouchDown)
        
        view.addSubview(button)
        
        view.addSubview(containerView)
        
        var button2 = UIButton(frame: CGRectMake(25, 25, 100, 100))
        button2.backgroundColor = UIColor.cyanColor()
        button2.addTarget(self, action: "foo", forControlEvents: .TouchDown)
        
        containerView.addSubview(button2)
    }
    
    func foo() {
        UIView.animateWithDuration(1.0, delay: 0, options: .CurveEaseInOut, animations: {
            self.view.backgroundColor = UIColor.redColor()
            },
            completion: { (var b) -> Void in
                UIView.animateWithDuration(1.0, delay: 0.5, options: .CurveEaseInOut, animations: {
                        self.view.backgroundColor = UIColor.whiteColor()
                }, completion: nil)
            }
        )
    }

    
    @IBAction func left() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
//            var x = self.originalCenter.x - 150
//            self.view.center = CGPointMake(x, self.originalCenter.y)
//            self.view.backgroundColor = UIColor.brownColor()
            self.containerView.frame = CGRectMake(self.frameWidth - 150, self.originalY, 150, self.frameHeight)
            }, completion: { (var b) -> Void in
                
        })
    }
    
    @IBAction func right() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveLinear, animations: {
//            self.view.center = self.originalCenter
//            self.view.backgroundColor = UIColor.whiteColor()
            self.containerView.frame = CGRectMake(self.frameWidth, self.originalY, 150, self.frameHeight)
            }, completion: { (var b) -> Void in
                
        })
    }
}

