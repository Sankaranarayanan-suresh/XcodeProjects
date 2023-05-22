//
//  JobViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import UIKit

class JobDetailsViewController: UITableViewController {
    
    var job : job?
    var shouldShowCloseButton = false
    var shouldShowApplyButton = true
    lazy var applyButton: UIButton = {
        let applyButton = UIButton()
        applyButton.setTitle("Apply", for: .normal)
        applyButton.setTitleColor(.label, for: .normal)
        applyButton.backgroundColor = .systemPink.withAlphaComponent(0.7)
        applyButton.layer.cornerRadius = 12
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        return applyButton
    }()
    
    override var hidesBottomBarWhenPushed: Bool{
        get{
            return true
        }
        set{
            super.hidesBottomBarWhenPushed = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Job Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(JobDetailsTableViewCell.self, forCellReuseIdentifier: JobDetailsTableViewCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        if shouldShowCloseButton{
            configNavBarItems()
        }
    }
    private func configNavBarItems(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonTapped))
    }
    @objc func closeButtonTapped(){
        dismiss(animated: true)
    }
    @objc func applyButtonTapped(){
        let resumeVC = ViewController()
        resumeVC.job = job!
        navigationController?.pushViewController(resumeVC, animated: true)
    }
   
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard shouldShowApplyButton else { return nil }
        let footerView = UIView()
        
        applyButton.addTarget(self, action: #selector(applyButtonTapped), for: .touchUpInside)
        footerView.addSubview(applyButton)
        NSLayoutConstraint.activate([
            applyButton.topAnchor.constraint(equalTo: footerView.topAnchor,constant: 10),
            applyButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            applyButton.widthAnchor.constraint(equalToConstant: 100),
            applyButton.heightAnchor.constraint(equalToConstant: 38)
            
        ])
        return footerView
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 100
        }
       return 44
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard shouldShowApplyButton else { return 0 }
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:JobDetailsTableViewCell.identifier, for: indexPath) as! JobDetailsTableViewCell
        guard let job = job else{
            cell.configureCell("", "")
            return cell
        }
        switch indexPath.row{
        case 0:
            cell.configureCell("Job Title", job.jobName)
        case 1:
            cell.configureCell("Job description", job.jobDescription)
        case 2:
            cell.configureCell("Experience Required", String(job.minimumYearsOfExperienceRequired))
        case 3:
            cell.configureCell("Company Name", job.companyName)
        case 4:
            cell.configureCell("Location", job.location)
        default: break
            
        }
        
        return cell
    }
}
