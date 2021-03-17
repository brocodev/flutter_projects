
import 'package:flutter/material.dart';
import 'package:flutter_projects/books_app/models/book.dart';
import 'package:flutter_projects/books_app/ui/widgets/header_book_delegate.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({
    Key key,
    @required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate: HeaderBookDelegate(book),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.grey[800]),
                  ),
                  const SizedBox(height: 10),
                  Text(book.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          height: 1.3, color: Colors.grey[500], fontSize: 14)),
                  const Divider(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Check the catalog',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey[800]),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 18,
                      )
                    ],
                  ),
                  const Divider(height: 40),
                  Row(
                    children: [
                      Text(
                        'Comments',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.grey[800]),
                      ),
                      const Spacer(),
                      Text(
                        '${book.reviews.length} Reviews',
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[400],
                        size: 18,
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(
                        (book.reviews.length > 4) ? 5 : book.reviews.length,
                        (index) {
                      final review = book.reviews[index];
                      return _ReviewContainer(review: review);
                    }),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Similar books',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.grey[800]),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 250,
              child: ListView.builder(
                itemExtent: 130,
                itemCount: Book.books.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  final book = Book.books[index];
                  return _SimilarBookCard(book: book);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SimilarBookCard extends StatelessWidget {
  const _SimilarBookCard({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(5, 5))
                ],
                image: DecorationImage(
                    image: AssetImage(book.srcImage), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 36,
            child: Text(
              book.title,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}

class _ReviewContainer extends StatelessWidget {
  const _ReviewContainer({
    Key key,
    @required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(review.authorReview.photoUrl),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.authorReview.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  review.review,
                  maxLines: 2,
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      review.date.toString().substring(0, 16),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.favorite_border,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                      '${review.likes}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.comment_outlined,
                      size: 14,
                      color: Colors.grey,
                    ),
                    Text(
                      '${review.replies}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
