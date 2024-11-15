import UIKit
extension UIViewController {
    func applyGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        
        let color1 = UIColor(red: 43/255, green: 0/255, blue: 99/255, alpha: 1).cgColor
        let color2 = UIColor.black.cgColor
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.8)
        
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
