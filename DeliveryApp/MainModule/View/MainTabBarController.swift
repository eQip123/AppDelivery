//
//  MainTabBarController.swift
//  DeliveryApp
//
//  Created by Aidar Asanakunov on 28/10/22.
//

import UIKit
import FirebaseAuth

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarAppearance()
        generateTabBar()
        navigationItem()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(viewController: MainViewController(), image: UIImage(named: "home")),
            generateVC(viewController: HistoryViewController() , image: UIImage(named: "history")),
            generateVC(viewController: NewOrderViewController(), image: UIImage(named: "newOrder")),
            generateVC(viewController: ChatViewController(), image: UIImage(named: "chat")),
            generateVC(viewController: ProfileViewCotroller(), image: UIImage(named: "info"))
        ]
    }
    private func generateVC(viewController: UIViewController, image: UIImage?) ->
    UIViewController {
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func navigationItem() {
        self.navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(toSignVC))
        navigationItem.rightBarButtonItem?.tintColor = .black
   }
    
    @objc func toSignVC() {
            do {
                try Auth.auth().signOut()
            }
            catch let err {
                print(err.localizedDescription)
            }
        navigationController?.popToRootViewController(animated: true)
    }
    private func setTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.shadowImage = nil
        appearance.shadowColor = nil
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance        
    }
}
