import UIKit

class ViewController: UIViewController {
    
    let resposiveLabel = ResponsiveView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Essetial parameters:
        resposiveLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        resposiveLabel.center = self.view.center
        
        // Adjustable parameters:
        resposiveLabel.backgroundColor = UIColor(red: 1/255, green: 121/255, blue: 190/255, alpha: 1.0)
        resposiveLabel.text = "Responsive label"
        resposiveLabel.layer.cornerRadius = 4
        resposiveLabel.layer.masksToBounds = true
        
        // Add to main view:
        self.view.addSubview(resposiveLabel)
        
        resposiveLabel.isUserInteractionEnabled = true
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPressRecognizer.minimumPressDuration = 0.2
    }
    
    @objc func longPressHandler() {
        resposiveLabel.becomeFirstResponder()
        
        let menu = UIMenuController()
        menu.arrowDirection = .default
        menu.setTargetRect(resposiveLabel.frame, in: self.view)
        menu.setMenuVisible(true, animated: true)
    }
    
    @objc func saveCliked() {
        resposiveLabel.resignFirstResponder()
        print("Saved")
    }
}

