class Post {
  String id;
  String title;
  String date;
  String image;


  Post({ this.id, this.title, this.image, this.date});

  Post.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    title = json['title'];
    date = json['createdAt'];
    image = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['image'] = this.image;
    return data;
  }
}