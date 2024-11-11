//
//  SceneDelegate.swift
//  Assingmnet21
//
//  Created by beqa on 03.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var keychainManager =  KeychainManager()
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
                window = UIWindow(windowScene: windowScene)
                
                if Storedinkey() {
                    let mainViewController = Quizz()
                    window?.rootViewController = UINavigationController(rootViewController: mainViewController)
                } else {
                    let loginViewController = LoginViewController()
                    window?.rootViewController = UINavigationController(rootViewController: loginViewController)
                }
                
                window?.makeKeyAndVisible()
            }
    
    private func Storedinkey() -> Bool {
           guard let usernameData = keychainManager.get(service: "some service", account: "username"),
                 let passwordData = keychainManager.get(service: "some service", account: "password") else
           {
               return false
           }
           
           let username = String(decoding: usernameData, as: UTF8.self)
           let password = String(decoding: passwordData, as: UTF8.self)
           
           return !username.isEmpty && !password.isEmpty
       }
    
}
