//
//  HomeTabBarController.swift
//  Dadi
//
//  Created by Dídac Serrano i Segarra on 13/09/2020.
//  Copyright © 2020 Dídac Serrano i Segarra. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .systemIndigo
        self.tabBar.unselectedItemTintColor = .systemGray
        
        viewControllers = [tabRoomSearchViewController,
                            tabChatViewController,
                            tabFavoritesViewController,
                            tabProfileViewController]
        
        for viewcontroller in self.viewControllers! {
            viewcontroller.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
    
    private var tabRoomSearchViewController: UIViewController {
        let wireframe = SearchWireframe()
        let tabViewController = wireframe.home
        tabViewController?.tabBarItem = UITabBarItem(title: nil,
        image: UIImage(named: "Icons_home_search", in: nil, compatibleWith: nil),
        selectedImage: UIImage(named: "Icons_home_search", in: nil, compatibleWith: nil))
        return tabViewController!
    }
    
    private var tabChatViewController: UIViewController {
        let tabViewController = ChatWireframe.createModule()
        tabViewController.tabBarItem = UITabBarItem(title: nil,
        image: UIImage(named: "Icons_home_chat", in: nil, compatibleWith: nil),
        selectedImage: UIImage(named: "Icons_home_chat", in: nil, compatibleWith: nil))
        return tabViewController
    }
    
    private var tabFavoritesViewController: UIViewController {
        let tabViewController = FavoritesWireframe.createModule()
        tabViewController.tabBarItem = UITabBarItem(title: nil,
        image: UIImage(named: "Icons_home_favorites", in: nil, compatibleWith: nil),
        selectedImage: UIImage(named: "Icons_home_favorites", in: nil, compatibleWith: nil))
        return tabViewController
    }
    
    private var tabProfileViewController: UIViewController {
        let tabViewController = ProfileWireframe.createModule()
        tabViewController.tabBarItem = UITabBarItem(title: nil,
        image: UIImage(named: "Icons_home_profile", in: nil, compatibleWith: nil),
        selectedImage: UIImage(named: "Icons_home_profile", in: nil, compatibleWith: nil))
        return tabViewController
    }
}
