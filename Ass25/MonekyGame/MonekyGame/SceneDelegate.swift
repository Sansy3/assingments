//
//  SceneDelegate.swift
//  MonekyGame
//
//  Created by beqa on 15.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
               window = UIWindow(windowScene: windowScene)
               window?.rootViewController = MonkeyVC()
               window?.makeKeyAndVisible()
           }
}

