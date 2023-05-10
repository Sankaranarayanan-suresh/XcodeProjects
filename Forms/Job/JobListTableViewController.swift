//
//  JobListTableViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class JobListTableViewController: UITableViewController {
    
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
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(JobInfoCellTableViewCell.self, forCellReuseIdentifier: JobInfoCellTableViewCell.identifier)
//        configureNavBarItems()
    }
    private func configureNavBarItems(){
        let profileImage = UIImage(systemName: "person.crop.circle")
        navigationItem.leftBarButtonItem = .init(image: profileImage, style: .plain, target: self, action: #selector(profileButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .systemPink
    }
    @objc func profileButtonTapped(){
        navigationController?.pushViewController(ProfileVC(), animated: true)
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
