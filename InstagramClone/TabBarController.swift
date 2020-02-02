//
//  TabBarController.swift
//  InstagramClone
//
//  Created by Daniel Inderwies on 2/1/20.
//  Copyright © 2020 Daniel Inderwies. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstViewController = FeedController()
        
        firstViewController.tabBarItem = UITabBarItem.init(tabBarSystemItem: .history, tag: 0)
        
        let secondViewController = ProfilController()
        
       secondViewController.tabBarItem = UITabBarItem.init(tabBarSystemItem: .more, tag: 1)
        
        let tabBarList = [firstViewController, secondViewController]
        
        viewControllers = tabBarList

    }
    
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
