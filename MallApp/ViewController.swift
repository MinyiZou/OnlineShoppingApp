//
//  ViewController.swift
//  MallApp
//
//  Created by zouminyi on 9/11/23.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let loginButton = UIButton(type: .custom)
        
        setupViewControllers()
        self.view.backgroundColor = .primaryBackground
        
//        let homeVC = HomeViewController()
//        homeVC.tabBarItem.image = R.image.home()
//        homeVC.tabBarItem.selectedImage = R.image.home_selected()
//        homeVC.tabBarItem.title = "Home"
//
//        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
//        self.addChild(navigationHomeVC)
    }

    func setupViewControllers() {
        let homeVC = createViewController(ofType: HomeViewController.self, image: R.image.home(), selectedImage: R.image.home_selected(), title: "Home")
        let navigationHomeVC = UINavigationController(rootViewController: homeVC)
        addChild(navigationHomeVC)
        
         let moreVC = createViewController(ofType: MoreViewController.self, image: R.image.mine(), selectedImage: R.image.mine_selected(), title: "More")
         let navigationMoreVC = UINavigationController(rootViewController: moreVC)
         addChild(navigationMoreVC)
        
    }

    func createViewController<T: UIViewController>(ofType: T.Type, image: UIImage?, selectedImage: UIImage?, title: String) -> T {
        let vc = T() //或者其他特定的VC
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.primaryNavigationBarText], for: .selected)
        vc.tabBarItem.title = title
        return vc
    }

}

