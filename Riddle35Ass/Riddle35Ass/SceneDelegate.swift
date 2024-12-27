//
//  SceneDelegate.swift
//  Riddle35Ass
//
//  Created by beqa on 27.12.24.
//

import UIKit



class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let mainMenuVC = MainMenuViewController()
        let navigationController = UINavigationController(rootViewController: mainMenuVC)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}
