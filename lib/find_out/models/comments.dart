class Comment {
  Comment({
    this.photoCommentUrl,
    this.comment,
    this.user,
    this.photoUserUrl,
    this.commentLikes,
    this.commentResponses,
  });

  final String? comment;
  final String? user;
  final String? photoUserUrl;
  final int? commentLikes;
  final int? commentResponses;
  final String? photoCommentUrl;

  static const _comment = 'Lorem Ipsum is simply dummy text of the printing'
      ' and typesett ing industry. Lorem Ipsum has been the industrys sta'
      'ndard dummy text ever since the 1500s, when an unknown '
      'printer took a galley of type and scrambled it to make a'
      ' type specimen book. It has survived not only five centu'
      'ries, but also the leap into electronic typesetting, rem'
      'aining essentially unchanged. It was popularised in the '
      '1960s with the release of Letraset sheets containing Lor'
      'em Ipsum passages, and more recently with desktop publis'
      'hing software like Aldus PageMaker including versions '
      ' Lorem Ipsum';

  static final defaultListComment = <Comment>[
    Comment(
      comment: _comment,
      commentLikes: 12,
      commentResponses: 5,
      photoUserUrl:
          'https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
      user: 'Ramiro Talavera',
    ),
    Comment(
      comment: _comment,
      commentLikes: 14,
      commentResponses: 3,
      photoUserUrl:
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=333&q=80',
      photoCommentUrl:
          'https://images.unsplash.com/photo-1468818438311-4bab781ab9b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80',
      user: 'Mariela Guajardo',
    ),
    Comment(
      comment: _comment,
      commentLikes: 12,
      commentResponses: 5,
      photoUserUrl:
          'https://images.unsplash.com/photo-1569124589354-615739ae007b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      user: 'Beca Lway',
    ),
    Comment(
      comment: _comment,
      commentLikes: 4,
      commentResponses: 19,
      photoUserUrl:
          'https://images.unsplash.com/photo-1493863641943-9b68992a8d07?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=739&q=80',
      photoCommentUrl:
          'https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
      user: 'Marcos Reine',
    ),
    Comment(
      comment: _comment,
      commentLikes: 12,
      commentResponses: 5,
      photoUserUrl:
          'https://images.unsplash.com/photo-1573878221976-aab98adadabc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=721&q=80',
      user: 'Rayman Smith',
    ),
  ];
}
