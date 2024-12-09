//
//  SceneDelegate.swift
//  Varjishi
//
//  Created by beqa on 26.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let vc = CurrencyConverterViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        
    }
    
    
    
}

