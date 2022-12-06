class API {
  static const hostconnection = "http://192.168.56.1/api_job_recruitment_app";
  static const hostConnectApi = "$hostconnection/tables";
  //posting applicants details to db
  static const postApplicant = "$hostConnectApi/postApplicantDetails.php";
  static const postEmployee = "$hostConnectApi/postNewEmployee.php";
  static const postJobs = "$hostConnectApi/postNewJobs.php";
}
