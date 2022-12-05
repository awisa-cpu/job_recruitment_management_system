class UserModel {
  int applicantid;
  String firstName;
  String otherNames;
  String lastName;
  String email;
  String phoneNumber;
  String dob;

  UserModel(
    this.applicantid,
    this.firstName,
    this.otherNames,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dob,
  );

  //this is to pass our applicants details in json format to the database
  Map<String, dynamic> toJson() => {
        "applicantid": applicantid.toString(),
        "firstName": firstName,
        "otherNames": otherNames,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "dob": dob,
      };
}
