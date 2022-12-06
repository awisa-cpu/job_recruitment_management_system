class EmployeeModel {
  String employeeid;
  String fullNames;
  String recruiterid;
  String jobid;
  String departmentid;
  String salary;
  String dependentid;
  String doa;

  EmployeeModel(
    this.employeeid,
    this.fullNames,
    this.recruiterid,
    this.jobid,
    this.departmentid,
    this.salary,
    this.dependentid,
    this.doa,
  );

  Map<String, dynamic> toJson() => {
        "employeeid": employeeid,
        "fullNames": fullNames,
        "recruiterid": recruiterid,
        "jobid": jobid,
        "departmentid": departmentid,
        "salary": salary,
        "dependentid": dependentid,
        "doa": doa,
      };
}
