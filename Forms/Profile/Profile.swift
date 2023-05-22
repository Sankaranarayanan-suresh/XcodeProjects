//
//  Profile.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import Foundation
import UIKit
struct profile {
    
    var profilePhoto : UIImage?
    let profileId : String
    var password : UITextInputPasswordRules
    var firstName: String
    var lastName: String
    var email : String
    let phoneNumber : String
    var DOB : Date
    var address : String
    var gender : Gender
    var shortNoteOnYou : String
    var yearsOfExperience : Int8
    var degree : String
    var lastWorkedCompany : String
    var currentCTC : Int
    var expectedCTC : Int
    
    init(profilePhoto: UIImage? = nil, profileId: String, password: UITextInputPasswordRules, firstName: String, lastName: String, email: String, phoneNumber: String, DOB: Date, address: String, gender: Gender, shortNoteOnYou: String, yearsOfExperience: Int8, degree: String, lastWorkedCompany: String, currentCTC: Int, expectedCTC: Int) {
        self.profilePhoto = profilePhoto
        self.profileId = profileId
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.DOB = DOB
        self.address = address
        self.gender = gender
        self.shortNoteOnYou = shortNoteOnYou
        self.yearsOfExperience = yearsOfExperience
        self.degree = degree
        self.lastWorkedCompany = lastWorkedCompany
        self.currentCTC = currentCTC
        self.expectedCTC = expectedCTC
        
    }
}
