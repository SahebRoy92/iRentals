//
//  MainTabController.swift
//  iRentals
//
//  Created by sahebroy on 25/06/22.
//

import UIKit

class MainTabController: UITabBarController {
    
    var presenter: MainTabbarPresenterRecieverProtocols
    
    init(_ presenter: MainTabbarPresenterRecieverProtocols) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error---")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.controllerSetup()
    }
    
    func controllerSetup() {
        let options = presenter.configure()
        var controllers = [UINavigationController]()
        for items in options {
            let tab = UITabBarItem.init(title: items.title, image: UIImage.init(named: items.image), selectedImage: UIImage.init(named: items.fillImage))
            let navigation = UINavigationController.init(rootViewController: items.controller)
            navigation.tabBarItem = tab
            navigation.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
            controllers.append(navigation)
        }
        self.viewControllers = controllers
        self.title = presenter.getTitle()
        self.configureTabbar()
    }
    
    func configureTabbar() {
        tabBar.isTranslucent = true
        tabBar.tintColor = Constants.Colors.global
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Constants.Colors.view
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
}
