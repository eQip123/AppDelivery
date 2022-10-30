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
        setTabBarAppearance()
        generateTabBar()
        hideBackButton()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainViewController(), image: UIImage(named: "home")),
            generateVC(viewController: HistoryViewController() , image: UIImage(named: "history")),
            generateVC(viewController: NewOrderViewController(), image: UIImage(named: "newOrder"))
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
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance        
    }
}
