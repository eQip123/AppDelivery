//
//  MainTabBarController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        hideBackButton()
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainViewController(), image: UIImage(named: "home")),
            generateVC(viewController: HistoryViewController() , image: UIImage(named: "history")),
            generateVC(viewController: NewOrderViewController(), image: UIImage(named: "newOrder")),
//            generateVC(viewController: ChatViewController(), image: UIImage(named: "Chat")),
//            generateVC(viewController: InfoViewController(), image: UIImage(named: "Info"))
        ]
    }
    private func generateVC(viewController: UIViewController, image: UIImage?) ->
    UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    private func hideBackButton() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
}
