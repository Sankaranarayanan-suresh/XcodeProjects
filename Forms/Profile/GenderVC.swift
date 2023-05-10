//
//  GenderVC.swift
//  Forms
//
//  Created by sankara-pt6210 on 10/05/23.
//

import UIKit

class GenderVC: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    weak var delegate : ResumeVCGenderDelegate?
    var genders: [Gender] {
        return Gender.allCases
    }
    
    lazy var genderPicker: UIPickerView = {
        let genderPicker = UIPickerView()
        genderPicker.translatesAutoresizingMaskIntoConstraints = false
        genderPicker.delegate = self
        genderPicker.dataSource = self
        return genderPicker
    }()
    
    convenience init(selectedValue: Gender){
        self.init(nibName: nil, bundle: nil)
        
        var row: Int = selectedValue == .male ? 0 : selectedValue == .felmale ? 1 : 2
        
        genderPicker.selectRow(row, inComponent: 0, animated: false)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = .tertiarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderPicker)
        configurePickerConstraints()
    }
    
    private func configurePickerConstraints(){
        NSLayoutConstraint.activate([
            
            genderPicker.widthAnchor.constraint(equalToConstant: 200),
            genderPicker.heightAnchor.constraint(equalToConstant: 200),
            genderPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderPicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.selectedGender(genders[row])
    }
}
