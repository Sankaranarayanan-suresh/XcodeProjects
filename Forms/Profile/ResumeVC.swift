//
//  ViewController.swift
//  Forms
//
//  Created by sankara-pt6210 on 10/05/23.
//

import UIKit

class ViewController: UIViewController{
    
    var job : job?
    var selectedGender : Gender = .other
    private var titles = [
        "profilePhoto","First Name","Last Name","Email","Phone number","DOB","Address","Gender","Short note on you","Years of Experience"," Degree","Last worked company","Current CTC","Expected CTC"
    ]
    private var selectedProfileImage : UIImage?
    //MARK: lazy var properties.
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var submit: UIButton = {
        let submit = UIButton()
        submit.setTitle("Submit", for: .normal)
        submit.setTitleColor(.label, for: .normal)
        submit.backgroundColor = .systemPink.withAlphaComponent(0.7)
        submit.layer.cornerRadius = 12
        submit.translatesAutoresizingMaskIntoConstraints = false
        return submit
    }()
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.image = UIImage(systemName: "person.crop.circle.fill")
        profileImageView.tintColor = .systemPink.withAlphaComponent(0.7)
        profileImageView.layer.cornerRadius = 50
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    lazy var pickImageButton: UIButton = {
        let pickImageButton = UIButton()
        pickImageButton.addSubview(profileImageView)
        pickImageButton.translatesAutoresizingMaskIntoConstraints = false
        return pickImageButton
    }()
    
    lazy var firstName: UITextField = {
        let firstName = UITextField()
        firstName.autocapitalizationType = .words
        firstName.translatesAutoresizingMaskIntoConstraints = false
        firstName.keyboardType = .default
        firstName.returnKeyType = .next
        firstName.backgroundColor = .clear
        
        return firstName
    }()
    
    lazy var lastName: UITextField = {
        let lastName = UITextField()
        lastName.backgroundColor = .clear
        lastName.autocapitalizationType = .words
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.keyboardType = .default
        lastName.returnKeyType = .next
        return lastName
    }()
    lazy var email: UITextField = {
        let email = UITextField()
        email.backgroundColor = .clear
        email.autocapitalizationType = .words
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        email.returnKeyType = .next
        return email
    }()
    
    lazy var phoneNumber: UITextField = {
        let phoneNumber = UITextField()
        phoneNumber.delegate = self
        phoneNumber.keyboardType = .numberPad
        phoneNumber.backgroundColor = .clear
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.returnKeyType = .next
        return phoneNumber
    }()
    lazy var dob: UIDatePicker = {
        let dob = UIDatePicker()
        dob.backgroundColor = .clear
        dob.translatesAutoresizingMaskIntoConstraints = false
        dob.datePickerMode = .date
        var dateComponents = DateComponents()
        dateComponents.year = 1997
        dateComponents.month = 4
        dateComponents.day = 18
        let calendar = Calendar.current
        let defaultDate = calendar.date(from: dateComponents)
        dob.date = defaultDate ?? Date()
        let loc = Locale.init(identifier: "india")
        dob.locale = loc
        dob.contentMode = .left
        return dob
    }()
    lazy var address: UITextView = {
        let address = UITextView()
        address.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        address.font = UIFont.systemFont(ofSize: 16)
        address.textColor = .label
        address.layer.cornerRadius = 8.0
        address.layer.masksToBounds = true
        address.isScrollEnabled = true
        address.backgroundColor = .clear
        address.isEditable = true
        return address
    }()
    
    lazy var gender: UILabel = {
        var gender = UILabel()
        gender.translatesAutoresizingMaskIntoConstraints = false
        gender.backgroundColor = .clear
        gender.textAlignment = .left
        gender.text = Gender.other.rawValue
        return gender
    }()
    lazy var shortNoteOnYou: UITextView = {
        let shortNoteOnYou = UITextView()
        shortNoteOnYou.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        shortNoteOnYou.font = UIFont.systemFont(ofSize: 16)
        shortNoteOnYou.textColor = .label
        shortNoteOnYou.layer.cornerRadius = 8.0
        shortNoteOnYou.layer.masksToBounds = true
        shortNoteOnYou.isScrollEnabled = true
        shortNoteOnYou.backgroundColor = .clear
        shortNoteOnYou.isEditable = true
        return shortNoteOnYou
    }()
    lazy var yearsOfExperience: UITextField = {
        let yearsOfExperience = UITextField()
        yearsOfExperience.delegate = self
        yearsOfExperience.keyboardType = .numberPad
        yearsOfExperience.backgroundColor = .clear
        yearsOfExperience.translatesAutoresizingMaskIntoConstraints = false
        yearsOfExperience.returnKeyType = .next
        return yearsOfExperience
    }()
    lazy var lastWorkedCompany : UITextField = {
        let lastWorkedCompany = UITextField()
        lastWorkedCompany.backgroundColor = .clear
        lastWorkedCompany.autocapitalizationType = .words
        lastWorkedCompany.translatesAutoresizingMaskIntoConstraints = false
        lastWorkedCompany.keyboardType = .default
        lastWorkedCompany.returnKeyType = .next
        return lastWorkedCompany
    }()
    lazy var currentCTC: UITextField = {
        let currentCTC = UITextField()
        currentCTC.delegate = self
        currentCTC.keyboardType = .numberPad
        currentCTC.backgroundColor = .clear
        currentCTC.translatesAutoresizingMaskIntoConstraints = false
        currentCTC.returnKeyType = .next
        return currentCTC
    }()
    lazy var expectedCTC: UITextField = {
        let expectedCTC = UITextField()
        expectedCTC.delegate = self
        expectedCTC.keyboardType = .numberPad
        expectedCTC.backgroundColor = .clear
        expectedCTC.translatesAutoresizingMaskIntoConstraints = false
        expectedCTC.returnKeyType = .next
        return expectedCTC
    }()
    
    lazy var degree: UITextField = {
        let degree = UITextField()
        degree.backgroundColor = .clear
        degree.autocapitalizationType = .words
        degree.translatesAutoresizingMaskIntoConstraints = false
        degree.keyboardType = .default
        degree.returnKeyType = .next
        return degree
    }()
    
    //MARK: ViewController delegate functions.
//    override func viewWillLayoutSubviews() {
//        print("iam called")
//        configureTableViewConstraints()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        configureTableViewConstraints()
        UITextField.connectFields(fields: [firstName, lastName,email,phoneNumber,yearsOfExperience,degree,lastWorkedCompany,currentCTC,expectedCTC])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(hideKeyBoard))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        }
    }
    @objc private func hideKeyBoard(){
        view.endEditing(true)
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        tableView.contentInset = .zero
    }
    
    //MARK: private functions
    private func configureTableViewConstraints(){
        title = "Resume"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomProfileTableViewCell.self, forCellReuseIdentifier: CustomProfileTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.allowsSelection = true
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let regex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return regex.evaluate(with: email)
    }
    private func isValidPhoneNumber(_ number: String) -> Bool{
        let pattern = #"^(\+91)?[6-9][0-9]{9}$"#
        let regex = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regex.evaluate(with: number)
    }
    private func validateInput(email: String, phoneNumber: String, age: Int, experience: Int, firstName: String, lastName: String, userGender: String, aboutMyself: String, ownedDegree: String, workedCompany: String, ECTC: Int, CCTC: Int) -> Bool {
        guard isValidEmail(email) else{
            showAlert(title: "Invalid Input", message: "Invalid Email-ID")
            return false
        }
        guard isValidPhoneNumber(phoneNumber) else{
            showAlert(title: "Invalid Input", message: "Invalid Phonenumber")
            return false
        }
        
        guard experience <= (age - 21)else {
            showAlert(title: "Invalid Input", message: "Experience cannot be greater than your age")
            return false
        }
        
        guard experience >= job!.minimumYearsOfExperienceRequired else{
            showAlert(title: "Invalid Input", message: "Job requires minimum of \(job!.minimumYearsOfExperienceRequired) years of experience.")
            return false
        }
        
        guard !firstName.isEmpty else {
            showAlert(title: "Invalid Input", message: "First name should not be empty.")
            return false
        }
        
        guard !lastName.isEmpty else {
            showAlert(title: "Invalid Input", message: "Last name should not be empty.")
            return false
        }
        
        guard !userGender.isEmpty else {
            showAlert(title: "Invalid Input", message: "Gender should be selected.")
            return false
        }
        
        guard !aboutMyself.isEmpty || aboutMyself.count < 255 else {
            showAlert(title: "Invalid Input", message: "About myself should not be empty or exceed 255 characters.")
            return false
        }
        
        guard experience <= (age - 20) else {
            showAlert(title: "Invalid Input", message: "Experience should be greater than age.")
            return false
        }
        
        guard !ownedDegree.isEmpty else {
            showAlert(title: "Invalid Input", message: "Owned degree should not be empty.")
            return false
        }
        
        guard !workedCompany.isEmpty else {
            showAlert(title: "Invalid Input", message: "Worked company should not be empty.")
            return false
        }
        
        guard ECTC > 0 && ECTC > CCTC else {
            showAlert(title: "Invalid Input", message: "ECTC should be greater than 0 and greater than CCTC.")
            return false
        }
        return true
    }
 private func showAlert(title :String, message: String){
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "OK", style: .cancel){ action in
            print("cancel button tapped")
        }
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    private func configureCellContents(_ cell : CustomProfileTableViewCell,_ indexPath : IndexPath){
        switch indexPath.row{
        case 0:
            pickImageButton.addTarget(self, action: #selector(pickImageButtonTapped), for: .touchUpInside)
            cell.valueView.addSubview(pickImageButton)

            NSLayoutConstraint.activate([
                
                pickImageButton.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor),
                pickImageButton.centerXAnchor.constraint(equalTo: cell.valueView.centerXAnchor),
                pickImageButton.widthAnchor.constraint(equalToConstant: 100),
                pickImageButton.heightAnchor.constraint(equalToConstant: 100),
                
                profileImageView.topAnchor.constraint(equalTo: pickImageButton.topAnchor),
                profileImageView.leadingAnchor.constraint(equalTo: pickImageButton.leadingAnchor),
                profileImageView.bottomAnchor.constraint(equalTo: pickImageButton.bottomAnchor),
                profileImageView.trailingAnchor.constraint(equalTo: pickImageButton.trailingAnchor),
            ])
            print("photo")
        case 1:
            cell.valueView.addSubview(firstName)
            NSLayoutConstraint.activate([
                firstName.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                firstName.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                firstName.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                firstName.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 2:
            cell.valueView.addSubview(lastName)
            NSLayoutConstraint.activate([
                lastName.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                lastName.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                lastName.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                lastName.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 3:
            cell.valueView.addSubview(email)
            NSLayoutConstraint.activate([
                email.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                email.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                email.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                email.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 4:
            cell.valueView.addSubview(phoneNumber)
            NSLayoutConstraint.activate([
                phoneNumber.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                phoneNumber.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                phoneNumber.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                phoneNumber.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 5:
            cell.valueView.addSubview(dob)
            NSLayoutConstraint.activate([
                dob.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                dob.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                dob.bottomAnchor.constraint(equalTo: cell.valueView.bottomAnchor),
            ])
        case 6:
            cell.valueView.addSubview(address)
        case 7:
            cell.valueView.addSubview(gender)
            cell.accessoryType = .disclosureIndicator
            NSLayoutConstraint.activate([
                gender.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                gender.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                gender.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                gender.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
                
            ])
        case 8:
            cell.valueView.addSubview(shortNoteOnYou)
        case 9:
            cell.valueView.addSubview(yearsOfExperience)
            NSLayoutConstraint.activate([
                yearsOfExperience.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                yearsOfExperience.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                yearsOfExperience.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                yearsOfExperience.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 10:
            cell.valueView.addSubview(degree)
            NSLayoutConstraint.activate([
                degree.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                degree.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                degree.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                degree.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 11:
            cell.valueView.addSubview(lastWorkedCompany)
            NSLayoutConstraint.activate([
                lastWorkedCompany.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                lastWorkedCompany.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                lastWorkedCompany.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                lastWorkedCompany.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 12:
            cell.valueView.addSubview(currentCTC)
            NSLayoutConstraint.activate([
                currentCTC.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                currentCTC.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                currentCTC.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                currentCTC.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
        case 13:
            cell.valueView.addSubview(expectedCTC)
            NSLayoutConstraint.activate([
                expectedCTC.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                expectedCTC.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                expectedCTC.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                expectedCTC.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor)
            ])
            
        default:
            break
        }
    }
}
//MARK: UITableViewDelegate and UITableViewDataSource functions.
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return titles.count
        }else{
            return 1
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == 0 else{
            return 44
        }
        if indexPath.row == 0{
            return 150
        }else if indexPath.row == 6{
            return 100
        }else if indexPath.row == 8{
            return 100
        }
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomProfileTableViewCell.identifier, for: indexPath) as! CustomProfileTableViewCell
            cell.configureCell(titles[indexPath.row])
            // Configure the cell...
            configureCellContents(cell,indexPath)
            return cell
        }
        else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
            submit.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
            cell.contentView.addSubview(submit)
            NSLayoutConstraint.activate([
                submit.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
                submit.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                submit.widthAnchor.constraint(equalToConstant: 100),
                submit.heightAnchor.constraint(equalToConstant: 38)
                
            ])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 7{
            return indexPath
        }else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 7{
            let vc = GenderVC(selectedValue: selectedGender)
            vc.delegate = self
            let nav = UINavigationController(rootViewController: vc)
            if let sheets = nav.sheetPresentationController {
                sheets.detents = [.medium()]
            }
            present(nav, animated: true)
        }
    }
    @objc func submitButtonTapped(){
        guard let firstName = firstName.text,let lastName = lastName.text, let emailID = email.text, let number = phoneNumber.text, let experience = yearsOfExperience.text,let homeAddress = address.text, let userGender = gender.text, let aboutMyself = shortNoteOnYou.text, let ownedDegree = degree.text, let workedCompany = lastWorkedCompany.text, let CCTC = currentCTC.text, let ECTC = expectedCTC.text  else{
            
            showAlert(title: "Error", message: "Check whether yopu have filled all your details.")
            return
        }
        let selectedDate = dob.date
        let year  = Calendar.current.component(.year, from: selectedDate)
        let age = Calendar.current.component(.year, from: Date()) - year
        
        
        if validateInput(email: emailID, phoneNumber: number, age: age, experience: (experience as NSString).integerValue, firstName: firstName, lastName: lastName, userGender: userGender, aboutMyself: aboutMyself, ownedDegree: ownedDegree, workedCompany: workedCompany, ECTC: (ECTC as NSString).integerValue, CCTC: (CCTC as NSString).integerValue){
            
            
            let profile = profile(profilePhoto: selectedProfileImage,
                                  profileId: emailID,
                                  password: UITextInputPasswordRules(descriptor: "Test@123"),
                                  firstName: firstName,
                                  lastName: lastName,
                                  email: emailID,
                                  phoneNumber: number,
                                  DOB: dob.date,
                                  address: homeAddress,
                                  gender: Gender(rawValue: userGender) ?? .other,
                                  shortNoteOnYou: aboutMyself,
                                  yearsOfExperience: Int8((experience as NSString).integerValue),
                                  degree: ownedDegree,
                                  lastWorkedCompany: workedCompany,
                                  currentCTC: (CCTC as NSString).integerValue,
                                  expectedCTC: (ECTC as NSString).integerValue)
            Database.shared.profiles.append(profile)
            
            if let jobApplied = self.job{
                
                let appliedJob = AppliedJob(job: jobApplied , profile: profile)
                Database.shared.appliedJobs.append(appliedJob)
                navigationController?.popToRootViewController(animated: false)
                
                MainRouter.shared.changeToAppliedJobsTab()
            }
        }else{
            showAlert(title: "Missing Fields values", message: "Missing mandatory fields")
        }
        
    }
    
}
//MARK: ResumeVCGenderDelegate functions.
extension ViewController : ResumeVCGenderDelegate{
    func selectedGender(_ gender: Gender) {
        self.gender.text = gender.rawValue
        self.selectedGender = gender
    }
}
//MARK: TextFieldDelegate functions.
extension ViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "+1234567890."
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
}
//MARK: imagePicker delegate functions
extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            profileImageView.image = image
            selectedProfileImage = image
            picker.dismiss(animated: true)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc func pickImageButtonTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
}
//MARK: textField extension
extension UITextField {
       class func connectFields(fields:[UITextField]) -> Void {
           guard let last = fields.last else {
               return
           }
           for i in 0 ..< fields.count - 1 {
               fields[i].returnKeyType = .next
               fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
           }
           last.returnKeyType = .go
           last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
       }
   }
