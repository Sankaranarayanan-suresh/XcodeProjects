import UIKit

class MaintabBarViewController : UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let appliedJob = AppliedJobsListVC()
        let homeVC = UINavigationController(rootViewController: WelcomeVC())
        let jobOpeningsVC = UINavigationController(rootViewController: JobListVC())
        let appliedJobVC = UINavigationController(rootViewController: appliedJob)
        
        
        homeVC.tabBarItem.image = UIImage(systemName: "house.fill")
        homeVC.title = "Home"
        jobOpeningsVC.tabBarItem.image = UIImage(systemName: "envelope.open.fill")
        jobOpeningsVC.title = "Job Openings"
        appliedJobVC.tabBarItem.image = UIImage(systemName: "paperplane.fill")
        appliedJobVC.title = "Applied Jobs"
        
        
        tabBar.tintColor = .systemPink.withAlphaComponent(0.7)
        
        setViewControllers([homeVC,jobOpeningsVC,appliedJobVC], animated: true)
        MainRouter.shared.tabBarController = self
        MainRouter.shared.appliedJobListVC = appliedJob
    }
    func setUpViewController(_ viewController: UIViewController) -> UIViewController{
        tabBarController?.setViewControllers([viewController], animated: false)
        return viewController
    }
    
    
}
