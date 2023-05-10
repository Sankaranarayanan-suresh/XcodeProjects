//
//  JobViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import UIKit

class JobDetailsViewController: UITableViewController {
    
    var job : job?
    lazy var applyButton: UIButton = {
        let applyButton = UIButton()
        applyButton.setTitle("Apply", for: .normal)
        applyButton.setTitleColor(.label, for: .normal)
        applyButton.backgroundColor = .systemPink.withAlphaComponent(0.7)
        applyButton.layer.cornerRadius = 12
        applyButton.translatesAutoresizingMaskIntoConstraints = false
        return applyButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Job Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(JobDetailsTableViewCell.self, forCellReuseIdentifier: JobDetailsTableViewCell.identifier)
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    @objc func applyButtonTapped(){
        let resumeVC = ResumeVC()
        resumeVC.job = job!
        navigationController?.pushViewController(resumeVC, animated: true)
    }
   
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
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
    private func handleComplete(indexPath: IndexPath) {
//        navigationController?.naviga
    }
//
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completion = UIContextualAction(style: .normal, title: "", handler:{
            [weak self] (_, _, completionHandler) in
            self?.handleComplete(indexPath: indexPath)
            completionHandler(true)
        })
        completion.image = UIImage(systemName: "checkmark")
        return UISwipeActionsConfiguration(actions: [completion])
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
        50
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
