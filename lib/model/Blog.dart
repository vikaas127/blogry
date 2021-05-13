class Blog {
  List<String> category;
  String sId;
  String title;
  String content;
  String userId;
  List<int> likeCount;
  List<ViewCount> viewCount;
  List<int> saveCount;
  String createdAt;
  String updatedAt;
  String slug;
  int iV;

  Blog(
      {this.category,
        this.sId,
        this.title,
        this.content,
        this.userId,
        this.likeCount,
        this.viewCount,
        this.saveCount,
        this.createdAt,
        this.updatedAt,
        this.slug,
        this.iV});

  Blog.fromJson(Map<String, dynamic> json) {
    category = json['category'].cast<String>();
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    userId = json['user_id'];
    likeCount = json['like_count'].cast<int>();
    if (json['view_count'] != null) {
      viewCount = new List<ViewCount>();
      json['view_count'].forEach((v) {
        viewCount.add(new ViewCount.fromJson(v));
      });
    }
    saveCount = json['save_count'].cast<int>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['user_id'] = this.userId;
    data['like_count'] = this.likeCount;
    if (this.viewCount != null) {
      data['view_count'] = this.viewCount.map((v) => v.toJson()).toList();
    }
    data['save_count'] = this.saveCount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}

class ViewCount {
  String sId;
  String title;
  String content;
  String userId;

  ViewCount({this.sId, this.title, this.content, this.userId});

  ViewCount.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    content = json['content'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['user_id'] = this.userId;
    return data;
  }
}
