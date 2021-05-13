class Profiledata {
  String avatar;
  List<String> selectedCategory;
  List<String> blogs;
  String sId;
  String username;
  Null name;
  String email;
  String password;
  bool type;
  String socialId;
  String createdAt;
  String updatedAt;
  int iV;
  String bio;

  Profiledata(
      {this.avatar,
        this.selectedCategory,
        this.blogs,
        this.sId,
        this.username,
        this.name,
        this.email,
        this.password,
        this.type,
        this.socialId,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.bio});

  Profiledata.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    selectedCategory = json['selected_category'].cast<String>();
    blogs = json['blogs'].cast<String>();
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
    socialId = json['social_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['selected_category'] = this.selectedCategory;
    data['blogs'] = this.blogs;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['type'] = this.type;
    data['social_id'] = this.socialId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['bio'] = this.bio;
    return data;
  }
}
