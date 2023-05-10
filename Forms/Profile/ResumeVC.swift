
import UIKit

class ResumeVC: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ResumeVCGenderDelegate {
    
    var job : job?
    var selectedGender : Gender = .other
    
    private static var id = 1
    
    private var titles = [
        "profilePhoto","First Name","Last Name","Email","Phone number","DOB","Address","Gender","Short note on you","Years of Experience"," Degree","Last worked company","Current CTC","Expected CTC"
    ]
    
    lazy var submit: UIButton = {
        let submit = UIButton()
        submit.setTitle("Submit", for: .normal)
        submit.setTitleColor(.label, for: .normal)
        submit.backgroundColor = .systemPink.withAlphaComponent(0.7)
        submit.layer.cornerRadius = 12
        submit.translatesAutoresizingMaskIntoConstraints = false
        return submit
    }()
    
    lazy var pickImageButton: UIButton = {
        let pickImageButton = UIButton()
        pickImageButton.setTitle("Pick Image", for: .normal)
        pickImageButton.setTitleColor(.systemBlue, for: .normal)
        pickImageButton.titleLabel?.font = .systemFont(ofSize: 15)
        pickImageButton.layer.cornerRadius = 12
        pickImageButton.translatesAutoresizingMaskIntoConstraints = false
        return pickImageButton
    }()
    
    lazy var pickerImageView: RoundedImage = {
        let imageView = RoundedImage()
        imageView.image = UIImage(systemName: "person.circle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var imagePickerView: UIStackView = {
        let imagePickerView = UIStackView(arrangedSubviews: [pickerImageView, pickImageButton])
        imagePickerView.axis = .vertical
        imagePickerView.alignment = .center
        imagePickerView.spacing = 15
        imagePickerView.translatesAutoresizingMaskIntoConstraints = false
        return imagePickerView
    }()
    
    lazy var firstName: UITextField = {
        let firstName = UITextField()
        firstName.autocapitalizationType = .words
        firstName.translatesAutoresizingMaskIntoConstraints = false
        firstName.keyboardType = .default
        firstName.returnKeyType = .done
        firstName.backgroundColor = .clear
        
        return firstName
    }()
    
    lazy var lastName: UITextField = {
        let lastName = UITextField()
        lastName.backgroundColor = .clear
        lastName.autocapitalizationType = .words
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.keyboardType = .default
        lastName.returnKeyType = .done
        return lastName
    }()
    lazy var email: UITextField = {
        let email = UITextField()
        email.backgroundColor = .clear
        email.autocapitalizationType = .words
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .default
        email.returnKeyType = .done
        return email
    }()
    
    lazy var phoneNumber: UITextField = {
        let phoneNumber = UITextField()
        phoneNumber.delegate = self
        phoneNumber.keyboardType = .phonePad
        phoneNumber.backgroundColor = .clear
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.returnKeyType = .done
        return phoneNumber
    }()
    lazy var dob: UIDatePicker = {
        let dob = UIDatePicker()
        dob.backgroundColor = .clear
        dob.translatesAutoresizingMaskIntoConstraints = false
        dob.datePickerMode = .date
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
        yearsOfExperience.keyboardType = .phonePad
        yearsOfExperience.backgroundColor = .clear
        yearsOfExperience.translatesAutoresizingMaskIntoConstraints = false
        yearsOfExperience.returnKeyType = .done
        return yearsOfExperience
    }()
    lazy var lastWorkedCompany : UITextField = {
        let lastWorkedCompany = UITextField()
        lastWorkedCompany.backgroundColor = .clear
        lastWorkedCompany.autocapitalizationType = .words
        lastWorkedCompany.translatesAutoresizingMaskIntoConstraints = false
        lastWorkedCompany.keyboardType = .default
        lastWorkedCompany.returnKeyType = .done
        return lastWorkedCompany
    }()
    lazy var currentCTC: UITextField = {
        let currentCTC = UITextField()
        currentCTC.delegate = self
        currentCTC.keyboardType = .phonePad
        currentCTC.backgroundColor = .clear
        currentCTC.translatesAutoresizingMaskIntoConstraints = false
        currentCTC.returnKeyType = .done
        return currentCTC
    }()
    lazy var expectedCTC: UITextField = {
        let expectedCTC = UITextField()
        expectedCTC.delegate = self
        expectedCTC.keyboardType = .phonePad
        expectedCTC.backgroundColor = .clear
        expectedCTC.translatesAutoresizingMaskIntoConstraints = false
        expectedCTC.returnKeyType = .done
        return expectedCTC
    }()
    
    lazy var degree: UITextField = {
        let degree = UITextField()
        degree.backgroundColor = .clear
        degree.autocapitalizationType = .words
        degree.translatesAutoresizingMaskIntoConstraints = false
        degree.keyboardType = .default
        degree.returnKeyType = .done
        return degree
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Resume"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomProfileTableViewCell.self, forCellReuseIdentifier: CustomProfileTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        
    }
    //MARK: GenderVC delegate Functions
    
    func selectedGender(_ gender: Gender) {
        self.gender.text = gender.rawValue
        self.selectedGender = gender
    }
    
    
    // MARK: textField delegate function
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "+1234567890."
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: string)
        return allowedCharacterSet.isSuperset(of: typedCharacterSet)
    }
    //MARK: tableView Delegate Functions.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 14
        }else{
            return 1
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
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
                submit.topAnchor.constraint(equalTo: cell.contentView.topAnchor,constant: 10),
                submit.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
                submit.widthAnchor.constraint(equalToConstant: 100),
                submit.heightAnchor.constraint(equalToConstant: 38)
                
            ])
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 7{
            return indexPath
        }else{
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 7{
            let vc = GenderVC(selectedValue: selectedGender)
            vc.delegate = self
            if let sheets = vc.sheetPresentationController {
                sheets.detents = [.custom(resolver: { _ in return 250 })]
            }
            present(vc, animated: true)
        }
    }
    //MARK: objc Functions
    @objc func submitButtonTapped(){
        
        
        guard let firstName = firstName.text,let lastName = lastName.text, let emailID = email.text, let number = phoneNumber.text, let experience = yearsOfExperience.text,let homeAddress = address.text, let userGender = gender.text, let aboutMyself = shortNoteOnYou.text, let ownedDegree = degree.text, let workedCompany = lastWorkedCompany.text, let CCTC = currentCTC.text, let ECTC = expectedCTC.text  else{
            
            showAlert(title: "Error", message: "Check whether yopu have filled all your details.")
            return
        }
        let selectedDate = dob.date
        let year  = Calendar.current.component(.year, from: selectedDate)
        let age = Calendar.current.component(.year, from: Date()) - year
        
        
        if validateInput(email: emailID, phoneNumber: number, age: age, experience: (experience as NSString).integerValue, firstName: firstName, lastName: lastName, userGender: userGender, aboutMyself: aboutMyself, ownedDegree: ownedDegree, workedCompany: workedCompany, ECTC: (ECTC as NSString).integerValue, CCTC: (CCTC as NSString).integerValue){
            
            
            let profile = profile(profileId: emailID,
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
            navigationController?.dismiss(animated: true)
        }else{
            showAlert(title: "Missing Fields values", message: "Missing mandatory fields")
        }
        
    }
    
    
    
    
    
    @objc func pickImageButtonTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    // MARK: Private Functions.
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        let regex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return regex.evaluate(with: email)
    }
    private func isValidPhoneNumber(_ number: String) -> Bool{
        let pattern = #"^\d{10}$"#
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
            cell.valueView.addSubview(imagePickerView)
            
            NSLayoutConstraint.activate([
                
                imagePickerView.centerXAnchor.constraint(equalTo: cell.valueView.centerXAnchor),
                imagePickerView.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                imagePickerView.bottomAnchor.constraint(equalTo: cell.valueView.bottomAnchor),
                imagePickerView.centerYAnchor.constraint(equalTo: cell.valueView.centerYAnchor),
                
                pickerImageView.widthAnchor.constraint(equalToConstant: 75),
                pickerImageView.heightAnchor.constraint(equalTo: cell.valueView.heightAnchor,multiplier: 0.5),
                pickerImageView.centerXAnchor.constraint(equalTo: cell.valueView.centerXAnchor),
                
                pickImageButton.bottomAnchor.constraint(equalTo: cell.valueView.bottomAnchor, constant: -10),
                pickImageButton.centerXAnchor.constraint(equalTo: cell.valueView.centerXAnchor),
                pickImageButton.widthAnchor.constraint(equalToConstant: 100),
                pickImageButton.heightAnchor.constraint(equalToConstant: 10)
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
            NSLayoutConstraint.activate([
                address.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                address.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                address.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                
            ])
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
            NSLayoutConstraint.activate([
                shortNoteOnYou.leadingAnchor.constraint(equalTo: cell.valueView.leadingAnchor,constant: 10),
                shortNoteOnYou.topAnchor.constraint(equalTo: cell.valueView.topAnchor),
                shortNoteOnYou.trailingAnchor.constraint(equalTo: cell.valueView.trailingAnchor),
                
            ])
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
        
        
        //MARK: imagePicker delegate functions
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
                pickerImageView.image = image
                picker.dismiss(animated: true)
            }
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

class RoundedImage: UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setRounded()
    }
}
