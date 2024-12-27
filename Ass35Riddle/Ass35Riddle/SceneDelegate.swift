//
//  SceneDelegate.swift
//  Ass35Riddle
//
//  Created by beqa on 26.12.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is of type UIWindowScene
        guard let windowScene = scene as? UIWindowScene else { return }

        // Initialize the window with the windowScene's bounds
        window = UIWindow(windowScene: windowScene)
        window?.frame = windowScene.coordinateSpace.bounds

        // Set the root view controller
        let mainViewController = MainViewController()
        window?.rootViewController = mainViewController

        // Make the window key and visible
        window?.makeKeyAndVisible()
    }

    // Other scene delegate methods can be implemented here
}
