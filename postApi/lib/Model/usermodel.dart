//DataModel dataModelFromjson(String str)=>DataModel().fromJson(jsonDecode(str));

class UserModel {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  UserModel({this.name, this.job, this.id, this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
