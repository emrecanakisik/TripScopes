//
//  MainTabBarController.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/04/2026.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SetupTabBars()
        ConfigureAppearance()
    }
    
    private func SetupTabBars(){
        let exploreVC = CreateNavigations(with: ExploreViewController(), title: "Explore", image: UIImage(systemName: "safari")!)
        
        let bookingsVC = CreateNavigations(with: BookingsViewController(), title: "Bookings", image: UIImage(systemName: "ticket")!)
        
        let savedVC = CreateNavigations(with: SavedViewController(), title: "Saved", image: UIImage(systemName: "heart")!)
        
        let profileVC = CreateNavigations(with: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person")!)
        
        self.setViewControllers([exploreVC, bookingsVC, savedVC, profileVC], animated: true)
        
    }
    
    private func CreateNavigations(with rootVC: UIViewController, title: String, image: UIImage) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootVC)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        rootVC.navigationItem.title = title
        return nav
    }
    
    private func ConfigureAppearance(){
        tabBar.tintColor = .systemBlue
        tabBar.barTintColor = .systemBackground
    }
    
}
