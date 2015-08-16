import UIKit

class ViewController: UIViewController {
    
    var originalX : CGFloat!
    var originalY : CGFloat!
    var frameHeight : CGFloat!
    var frameWidth : CGFloat!
    var originalCenter : CGPoint!
    
    var containerView = UIView()
    
    var button : UIButton!
    var button2 : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalX      = self.view.frame.origin.x
        originalY      = self.view.frame.origin.y
        frameHeight    = self.view.frame.height
        frameWidth     = self.view.frame.width
        
        button = UIButton(frame: CGRectMake(200, 25, 100, 100))
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "foo", forControlEvents: .TouchDown)
        
        view.addSubview(button)
        
        containerView.userInteractionEnabled = true
        containerView.frame = CGRectMake(frameWidth, originalY, 150, frameHeight)
        containerView.backgroundColor = UIColor.magentaColor()
        containerView.clipsToBounds = false
        
        button2 = UIButton(frame: CGRectMake(25, 25, 100, 100))
        button2.backgroundColor = UIColor.cyanColor()
        button2.addTarget(self, action: "foo", forControlEvents: .TouchDown)
        
        view.addSubview(containerView)
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
    
    func goodLeft() {
        containerView.frame = CGRectMake(frameWidth - 150, originalY, 150, frameHeight)
    }
    
    func goodRight() {
        containerView.frame = CGRectMake(frameWidth, originalY, 150, frameHeight)
    }
    
    func badLeft() {
        view.frame = CGRectMake(originalX - 150, originalY, view.frame.width, view.frame.height)
    }
    
    func badRight() {
        view.frame = CGRectMake(originalX, originalY, view.frame.width, view.frame.height)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        NSLog("got touches")
        super.touchesBegan(touches, withEvent: event)
    }
    
    let good = true
    
    @IBAction func left() {
        UIView.animateWithDuration(0.3,
            animations: {
                if self.good {
                    self.goodLeft()
                } else {
                    self.badLeft()
                }
            },
            completion: { (var b) in
                self.logCoordinates()
            }
        )
    }
    
    @IBAction func right() {
        UIView.animateWithDuration(0.3,
            animations: {
                if self.good {
                    self.goodRight()
                } else {
                    self.badRight()
                }
            },
            completion: { (var b) in
                self.logCoordinates()
            }
        )
    }
    
    func logCoordinates() {
        NSLog("containerView frame x \(self.containerView.frame.origin.x)")
        NSLog("containerView frame y \(self.containerView.frame.origin.y)")
        NSLog("button2 frame x \(self.button2.frame.origin.x)")
        NSLog("button2 frame y \(self.button2.frame.origin.y)")
    }
}

