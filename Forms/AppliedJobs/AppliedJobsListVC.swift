//
//  JobListTableViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 04/05/23.
//

import UIKit

class AppliedJobsListVC: UITableViewController {
    
    var jobs = [AppliedJob]()
    
    
    convenience init(){
        self.init(style: .insetGrouped)
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Applied Jobs"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(AppliedJobListCell.self, forCellReuseIdentifier: AppliedJobListCell.identifier)
        configureDataSource()
    }
    func reloadView(){
        configureDataSource()
        tableView.reloadData()
    }
    private func configureDataSource(){
        jobs = Database.shared.appliedJobs
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppliedJobListCell.identifier, for: indexPath) as! AppliedJobListCell
        cell.configureCell(jobs[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       65
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appliedJobDetailsVC = AppliedJobDetailsVC()
        let profile = jobs[indexPath.row].profile
        
        appliedJobDetailsVC.setFormElems(elems: createCustomArray(using:profile))
        appliedJobDetailsVC.appliedJobs = jobs[indexPath.row]
        navigationController?.pushViewController(appliedJobDetailsVC, animated: true)
    }
    func createCustomArray(using profile : profile) -> [CustomFormCellObj]{
        var resultString :String = ""
        let date = profile.DOB// Replace this with your own date object

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)

        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d,yyyy"
            resultString = outputFormatter.string(from: date)
            print(resultString)
        }
        var customArray = [CustomFormCellObj]()
        customArray.append(CustomFormCellObj(name: "Profile Photo", type: .imageView, value: profile.profilePhoto as Any))
        customArray.append(CustomFormCellObj(name: "First Name", type: .label, value: profile.firstName))
        customArray.append(CustomFormCellObj(name: "Last Name", type: .label, value: profile.lastName))
        customArray.append(CustomFormCellObj(name: "Email", type: .label, value: profile.email))
        customArray.append(CustomFormCellObj(name: "Phone number", type: .label, value: profile.phoneNumber))
        customArray.append(CustomFormCellObj(name: "DOB", type: .label, value: resultString))
        customArray.append(CustomFormCellObj(name: "Address", type: .label, value: profile.address))
        customArray.append(CustomFormCellObj(name: "Gender", type: .label, value: profile.gender.rawValue))
        customArray.append(CustomFormCellObj(name: "Short note on you", type: .label, value: profile.shortNoteOnYou))
        customArray.append(CustomFormCellObj(name: "Experience", type: .label, value: String(profile.yearsOfExperience) + " years"))
        customArray.append(CustomFormCellObj(name: "Degree", type: .label, value: profile.degree))
        customArray.append(CustomFormCellObj(name: "Previous Company", type: .label, value: profile.lastWorkedCompany))
        customArray.append(CustomFormCellObj(name: "Current CTC", type: .label, value: String(profile.currentCTC)))
        customArray.append(CustomFormCellObj(name: "Expected CTC", type: .label, value: String(profile.expectedCTC)))
        
        return customArray
    }
}
