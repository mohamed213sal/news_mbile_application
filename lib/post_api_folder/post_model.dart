class PostModel2{
  String id;
  String title;
  String content;
  String date_written;
  String featured_image;
  int votesUp, votesDown;
  List<int> votersUp, votersDown;
  String userId, categoryId;

  PostModel2({
      this.id,
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

  /*
//very important hint by using {} with constructor we have to[Must]
//write the name of variable first to be like this
// id:"222",title:"mohamed amer title uaAmer",.....and so on
*/

}
