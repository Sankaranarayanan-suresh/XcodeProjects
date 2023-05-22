//
//  AppliedJobDetailsTableViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 11/05/23.
//

import UIKit

enum FormType {
    case label
    case imageView
}

struct CustomFormCellObj {
    var name: String
    var type: FormType
    var value: Any
}
struct SectionData {
    let sectionName: String?
    var rows: [CustomFormCellObj]
}
class AppliedJobDetailsVC : UITableViewController {
    
    var appliedJobs : AppliedJob?
    var formEl: [CustomFormCellObj] = []
    
   
    
    var dataSource = [SectionData]()
   
    convenience init() {
        self.init(style: .insetGrouped)
    }
    
    override init(style: UITableView.Style) {
        super.init(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
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
        title = "AppliedJobDetails"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ViewProfileCell.self, forCellReuseIdentifier: ViewProfileCell.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        configureDataSource()
        if tabBarController?.selectedIndex != 2 {
            navigationController?.popToRootViewController(animated: false)
        }
        view.inputViewController?.hidesBottomBarWhenPushed = true
    }
    
    func setFormElems(elems: [CustomFormCellObj]) {
        self.formEl = elems
    }

    private func configureDataSource() {
        dataSource = []
        var data = [CustomFormCellObj]()
        for i in 0..<formEl.count {
            if data.count < 4 {
                data.append(formEl[i])
            } else {
                dataSource.append(SectionData(sectionName: nil, rows: data))
                data = []
                data.append(formEl[i])
            }
        }
        if !data.isEmpty {
            dataSource.append(SectionData(sectionName: nil, rows: data))
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataSource.count + 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 || section == dataSource.count{
            return 1
        }
        return dataSource[section].rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: ViewProfileCell.identifier, for: indexPath) as! ViewProfileCell
            cell.selectionStyle = .none
            cell.configureCell(dataSource[0].rows)
            return cell
        }else if indexPath.section == dataSource.count{
            let cell = UITableViewCell()
            var config = UIListContentConfiguration.cell()
            config.text = "View Job Details"
            config.textProperties.alignment = .center
            config.textProperties.color = .systemBlue
            cell.contentConfiguration = config
            return cell
        }else{
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            var config = UIListContentConfiguration.valueCell()
            let elem = dataSource[indexPath.section].rows[indexPath.row]
            switch elem.type {
            case .imageView:
                config.text = elem.name
                if let image = elem.value as? UIImage {
                    config.image = image
                }
            case .label:
                config.text = elem.name
                config.secondaryText = elem.value as? String
            }
            cell.contentConfiguration = config
            return cell
        }
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }
        return 44
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.section == dataSource.count{
            return indexPath
        }
        return nil
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == dataSource.count{
            let vc = JobDetailsViewController()
            vc.job = appliedJobs?.job
            vc.shouldShowApplyButton = false
            vc.shouldShowCloseButton = true
            let nav = UINavigationController(rootViewController: vc)
            if let sheets = nav.sheetPresentationController {
                sheets.detents = [.custom(resolver: { _ in return 500 })]
            }
            present(nav, animated: true)
        }
    }
}
