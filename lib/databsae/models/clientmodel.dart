class ClientModel {
  int id;
  String firstname;
  String lastname;
  String whatsappNo;
  String email;
  String location;
  String project;

  ClientModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.whatsappNo,
      this.email,
      this.location,
      this.project});

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    location = json['location'];
    project = json['project'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['whatsapp_no'] = whatsappNo;
    data['email'] = email;
    data['location'] = location;
    data['project'] = project;
    return data;
  }
}
