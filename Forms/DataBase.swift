//
//  DBFile.swift
//  Forms
//
//  Created by sankara-pt6210 on 05/05/23.
//

import Foundation

class Database {
    static let shared = Database()

    var jobs = [job]()
    var profiles = [profile]()
    var appliedJobs = [AppliedJob]()
    
    
    private init() {}
}

