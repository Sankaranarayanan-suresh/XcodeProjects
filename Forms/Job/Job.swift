import Foundation

struct job{
    let JobId : String
    let jobName : String
    let jobDescription : String
    let minimumYearsOfExperienceRequired : Int8
    let companyName : String
    let location : String

    init(JobId: String, jobName: String, jobDescription: String, minimumYearsOfExperienceRequired: Int8, companyName: String, location: String) {
        self.JobId = JobId
        self.jobName = jobName
        self.jobDescription = jobDescription
        self.minimumYearsOfExperienceRequired = minimumYearsOfExperienceRequired
        self.companyName = companyName
        self.location = location
    }
}
