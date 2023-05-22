//
//  JobListTableViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class JobListVC: UITableViewController {
    
    var jobs = [
    job(JobId: "1", jobName: "MTS", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Cognizant", location: "chennai"),
    
    job(JobId: "2", jobName: "Project Trainee", jobDescription: "something to be written something to be written something to be writtensomething to be written something to be written something to be written something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    job(JobId: "3", jobName: "Project Trainee", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Cognizant", location: "chennai"),
    
    job(JobId: "4", jobName: "MTS", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "Hyderabad"),
    
    job(JobId: "5", jobName: "Project Trainee", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Cognizant", location: "chennai"),
    
    job(JobId: "6", jobName: "MTS", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    job(JobId: "7", jobName: "MTS", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    job(JobId: "8", jobName: "Project Trainee", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    job(JobId: "9", jobName: "MTS", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    job(JobId: "10", jobName: "Project Trainee", jobDescription: "something to be written", minimumYearsOfExperienceRequired: 2, companyName: "Zoho", location: "chennai"),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Job Openings"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(JobInfoCellTableViewCell.self, forCellReuseIdentifier: JobInfoCellTableViewCell.identifier)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JobInfoCellTableViewCell.identifier, for: indexPath) as! JobInfoCellTableViewCell
        cell.configureCell(jobs[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       65
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let jobVc = JobDetailsViewController()
        jobVc.job = jobs[indexPath.row]
        navigationController?.pushViewController(jobVc, animated: true)
    }    
}
