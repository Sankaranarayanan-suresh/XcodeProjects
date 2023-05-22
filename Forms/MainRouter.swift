//
//  MainTabBarRouter.swift
//  Forms
//
//  Created by sankara-pt6210 on 11/05/23.
//
import UIKit
class MainRouter{
    
    weak var tabBarController : UITabBarController?
    weak var welcomeVC : WelcomeVC?
    weak var jobListVC : JobListVC?
    weak var appliedJobListVC : AppliedJobsListVC?
    
    static let shared = MainRouter()
    private init(){
        
    }
    
    func changeToAppliedJobsTab(){
        tabBarController?.selectedIndex = 2
        appliedJobListVC?.reloadView()
    }
    
    
}
