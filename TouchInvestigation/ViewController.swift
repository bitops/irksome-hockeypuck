import UIKit

class ViewController: UIViewController, MagicViewDelegate {
    
    var originalX : CGFloat!
    var originalY : CGFloat!
    
    var containerView = UIView()
    
    var button : UIButton!
    var button2 : UIButton!
    var button3 : UIButton!
    
    var tableViewController = FooTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        originalX      = self.view.frame.origin.x
        originalY      = self.view.frame.origin.y
        
        button = UIButton(frame: CGRectMake(200, 25, 100, 100))
        button.backgroundColor = UIColor.greenColor()
        button.addTarget(self, action: "foo", forControlEvents: .TouchDown)
        
        button3 = UIButton(frame: CGRectMake(200, 350, 100, 100))
        button3.backgroundColor = UIColor.purpleColor()
        button3.addTarget(self, action: "baz", forControlEvents: .TouchDown)
        
        view.addSubview(button)
        view.addSubview(button3)
        
        containerView.frame = CGRectMake(self.view.frame.width, originalY, 150, self.view.frame.height)
        containerView.userInteractionEnabled = true
        containerView.backgroundColor = UIColor.magentaColor()
        containerView.clipsToBounds = false
        
        button2 = UIButton(frame: CGRectMake(25, 25, 100, 100))
        button2.backgroundColor = UIColor.cyanColor()
        button2.addTarget(self, action: "bar", forControlEvents: .TouchDown)
        
        view.addSubview(containerView)
        containerView.addSubview(button2)
    }
    
    func animationDidFinish() {
        self.containerView.hidden = false
        UIView.animateWithDuration(3.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseOut,
            animations: {
                self.button.transform = CGAffineTransformMakeRotation(45.0)
            },
            completion: {(var b) in
                
            }
        )
    }
    
    func baz() {
        containerView.hidden = true
        tableViewController.delegate = self
        tableViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(tableViewController, animated: true, completion: nil)
    }
    
    func foo() {
        UIView.animateWithDuration(1.0) {
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    
    func bar() {
        UIView.animateWithDuration(1.0) {
            self.view.backgroundColor = UIColor.blueColor()
        }
    }
    
    @IBAction func left() {
        UIView.animateWithDuration(0.3) {
            self.view.frame = CGRectMake(self.originalX - 150, self.originalY, self.view.frame.width + 150, self.view.frame.height)
        }
    }
    
    @IBAction func right() {
        UIView.animateWithDuration(0.3) {
            self.view.frame = CGRectMake(self.originalX, self.originalY, self.view.frame.width, self.view.frame.height)
        }
    }

}

