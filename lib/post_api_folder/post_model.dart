class Post {
  String id, title, content, featured_image;
  int votesUp, votesDown;
  List<int> votersUp, votersDown;
  String userId, categoryId;
String date_written;
  //hint that this should be name constructor to use it easily ua_amer
  Post(
      {this.id,
      this.title,
      this.content,
      this.date_written,
      this.featured_image,
      this.votesUp,
      this.votesDown,
      this.votersUp,
      this.votersDown,
      this.userId,
      this.categoryId});
}
