class JobModel {
  String jobid;
  String jobclassification;
  String jobDecription;
  String jobName;
  String appliedDepartment;
  String salary;
  String jobStatus;
  String location;

  JobModel(
    this.jobid,
    this.jobclassification,
    this.jobDecription,
    this.jobName,
    this.appliedDepartment,
    this.salary,
    this.jobStatus,
    this.location,
  );

  Map<String, dynamic> toJson() => {
        "jobid": jobid,
        "jobclassification": jobclassification,
        "jobDescription": jobDecription,
        "jobName": jobName,
        "appliedDepartment": appliedDepartment,
        "salary": salary,
        "jobStatus": jobStatus,
        "location": location,
      };
}
