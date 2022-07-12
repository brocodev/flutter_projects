import 'dart:math' show Random;

import 'package:flutter_projects/projects/bookstore_app/models/user_book.dart';

export 'package:flutter_projects/projects/bookstore_app/models/user_book.dart';

class Book {
  Book({
    this.title,
    this.author,
    this.category,
    this.description,
    this.readers,
    this.rate,
    this.srcImage,
    this.views,
    this.likes,
    this.reviews,
  });

  final String? title;
  final String? author;
  final String? category;
  final String? description;
  final double? rate;
  final int? views;
  final int? likes;
  final List<UserBook>? readers;
  final List<Review>? reviews;
  final String? srcImage;

  static List<String> get bookCategories => [
        'Self-Help',
        'Romance',
        'Fiction',
        'Science',
        'Food',
        'Art & Literature',
        'Biography',
        'Thriller',
        'Technology',
        'Adventure',
        'Erotic',
        'Suspense',
        'Drama',
        'Motivational',
        'Art',
        'Learning',
        'Programming',
        'Horror',
        'Sci-Fi',
        'Astrology',
        'Physic',
        'Biology',
      ];

  static final books = [
    Book(
      title: 'When Harry Met Minnie',
      author: 'Martha Teichner',
      category: 'Self-Help',
      description: 'There are true fairy tales. Stories that exist because '
          'impossible-to-explain coincidences change everything. Except '
          'in real life, not all of them have conventional, happily-ever'
          '-after endings. When Harry Met Minnie is that kind of fairy '
          'tale, with the vibrant, romantic New York City backdrop of its '
          'namesake, the movie When Harry Met Sally, and the bittersweet '
          'wisdom of Tuesdays with Morrie.',
      srcImage: 'assets/img/books/when harry met minnie.jpg',
      likes: 9991,
      rate: 4.3,
      views: 13490,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Smalltime: A Story of My Family and the Mob',
      author: 'Russell Shorto ',
      category: 'Self-Help',
      description:
          'Smalltime is a mob story straight out of central casting―but with'
          'a difference, for the small-town mob, which stretched from '
          'Schenectady to Fresno, is a mostly unknown world. The location'
          ' is the brawny postwar factory town of Johnstown, Pennsylvania.'
          ' The setting is City Cigar, a storefront next to City Hall, '
          'behind which Russ and his brother-in-law, “Little Joe,” '
          'operate a gambling empire and effectively run the town.',
      srcImage: 'assets/img/books/small time.jpg',
      likes: 17899,
      rate: 4.5,
      views: 24992,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Black Buck',
      author: 'Mateo Askaripour',
      category: 'Self-Help',
      description:
          'An unambitious twenty-two-year-old, Darren lives in a Bed-Stuy '
          'brownstone with his mother, who wants nothing more than to '
          'see him live up to his potential as the valedictorian of '
          'Bronx Science. But Darren is content working at Starbucks in '
          'the lobby of a Midtown office building, hanging out with his '
          'girlfriend, Soraya, and eating his mother’s feed-cooked meals. '
          'All that changes when a chance encounter with Rhett Daniels, '
          'the silver-tongued CEO of Sumwun, NYC’s hottest tech startup, '
          'results in an exclusive invitation for Darren to join an elite '
          'sales team on the thirty-sixth floor.',
      srcImage: 'assets/img/books/black buck.jpg',
      likes: 8901,
      rate: 4.2,
      views: 11002,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Four Winds: A Novel',
      author: 'Kristin Hannah',
      category: 'Fiction',
      description:
          'From the number-one bestselling author of The Nightingale and '
          'The Great Alone comes a powerful American epic about love '
          'and heroism and hope, set during the Great Depression, a '
          'time when the country was in crisis and at war with itself, '
          'when millions were out of work and even the land seemed to '
          'have turned against them',
      srcImage: 'assets/img/books/the four winds.jpg',
      likes: 10920,
      rate: 3.8,
      views: 13002,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Lives of Lucian Freud',
      author: 'William Feaver ',
      category: 'Art & Literature',
      description:
          'The final forty years of Freud’s life were a period of increasing '
          'recognition and fame, and of prodigious output. He was obsessed '
          'with his art, and with the idea of producing paintings that '
          '“astonish, disturb, seduce, convince.” He was equally energetic '
          'and ambitious in his private life.  This book opens with his '
          'dramatic affair with Jacquetta Eliot, which led to some of his '
          'most intimate portraits and to the start of two important, '
          'lifelong friendships, with Jane Willoughby and Susanna '
          'Chancellor. Freud talks about his art at all stages, how it '
          'changed in the seventies and his first retrospective in London '
          'in 1974. His move to a new studio in Holland Park in the late '
          'seventies marked an important increase in the scale of his work,'
          ' such as Large Interior W11 (After Watteau), which was his '
          'breakthrough painting. In this space, people would come and '
          'go—his children, his lover, the painter Celia Paul and all the'
          ' sitters from his nightlife. His close friendship with Francis'
          ' Bacon would end and be replaced with that of Frank Auerbach.'
          ' His obsession with gambling would give way to work, and from '
          'the nineties through the 2000s, a wide range of subjects would '
          'sit for him, including the performance artist Leigh Bowery; '
          'Kate Moss; Jerry Hall; supervisor Sue Tilley; his longtime '
          'assistant, David Dawson; his own children; and, in 2001, '
          'Queen Elizabeth. Two phenomenally successful exhibitions w'
          'ould transform his international reputation: the Hirshhorn '
          'Museum in Washington DC in 1988 and a retrospective at the '
          'Tate in 2002.',
      srcImage: 'assets/img/books/the lives of lucian freud.jpg',
      likes: 7882,
      rate: 4.3,
      views: 9230,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'See Her Die',
      author: 'Melinda Leigh',
      category: 'Romance',
      description:
          'New sheriff Bree Taggert is called to a shooting in a campground '
          'shuttered for the winter. But she arrives to find a perplexing '
          'crime. There is no shooter, no victim, and no blood. No one but'
          ' Bree believes the sole witness, Alyssa, a homeless teenager '
          'who insists she saw her friend shot.',
      srcImage: 'assets/img/books/see her die.jpg',
      likes: 10920,
      rate: 3.8,
      views: 13002,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Copenhagen Trilogy: Childhood; Youth; Dependency',
      author: 'Tove Ditlevsen',
      category: 'Biography',
      description:
          'Tove Ditlevsen is today celebrated as one of the most important '
          'and unique voices in twentieth-century Danish literature, '
          'and The Copenhagen Trilogy (1969–71) is her acknowledged '
          'masterpiece. Childhood tells the story of a misfit child’s '
          'single-minded determination to become a poet; Youth describes '
          'her early experiences of sex, work, and independence. '
          'Dependency picks up the story as the narrator embarks on '
          'the first of her four marriages and goes on to describe her '
          'horrible descent into drug addiction, enabled by her sinister, '
          'gaslighting doctor-husband.',
      srcImage: 'assets/img/books/the copenhagen trilogy.jpg',
      likes: 17899,
      rate: 4.5,
      views: 24992,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: "Don't Promise Me Rainbows",
      author: 'Susan Aylworth',
      category: 'Romance',
      description:
          'When faced with a birthing emergency in his prized breeding stock, '
          'pig farmer Chris McAllister calls the local veterinarian for '
          'help. He expects the wiry middle-aged man his family has long '
          'trusted, not a petite, but tough young woman whose edgy '
          'personality could qualify her as an Amazon queen from Greek '
          'Mythology. Even so, he can’t avoid a magnetic attraction '
          'to the pretty, red-haired vet',
      srcImage: 'assets/img/books/dont promise me rainbows.jpg',
      likes: 9991,
      rate: 4.3,
      views: 13490,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'It Ends with Us: A Novel ',
      author: 'Colleen Hoover',
      category: 'Romance',
      description:
          'Instant New York Times Bestseller The newest, highly anticipated '
          'novel from beloved #1 New York Times bestselling author, '
          'Colleen Hoover.Sometimes it is the one who loves you who hurts'
          ' you the most. Lily hasn#8217;t always had it easy, but '
          'that#8217;s never stopped her from working hard for the '
          'life she wants. She#8217;s come a long way from the small town i'
          'n Maine where she grew up#8212;she graduated from college, '
          'moved to Boston, and started her own business. So when she '
          'feels a spark with',
      srcImage: 'assets/img/books/it ends with us.jpg',
      likes: 8291,
      rate: 3.4,
      views: 10490,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Food: What the Heck Should I Cook?:',
      author: 'Dr Mark Hyman ',
      category: 'Food',
      description:
          "Dr. Mark Hyman's Food: What the Heck Should I Eat? revolutionized"
          ' the way we view food, busting long-held nutritional myths '
          'that have sabotaged our health and kept us away from delicious '
          'foods that are actually good for us. Now, in this companion coo'
          'kbook, Dr. Hyman shares more than 100 delicious recipes to hel'
          'p you create a balanced diet for weight loss, longevity, and op'
          'timum health. Food is medicine, and medicine never tasted or f'
          'elt so good.',
      srcImage: 'assets/img/books/food what should i cook.jpg',
      likes: 7891,
      rate: 4.4,
      views: 9012,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Food: What the Heck Should I Eat?',
      author: 'Dr Mark Hyman ',
      category: 'Food',
      description:
          "Did you know that eating oatmeal actually isn't a healthy way t"
          "o start the day? That milk doesn't build bones, and eggs are"
          "n't the devil?",
      srcImage: 'assets/img/books/food what should i eat.jpg',
      likes: 7891,
      rate: 4.4,
      views: 9012,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Food Lab: Better Home Cooking Through Science',
      author: 'J Kenji López',
      category: 'Food',
      description:
          'Ever wondered how to pan-fry a steak with a charred crust and an '
          "interior that's perfectly medium-rare from edge to edge when "
          "you cut into it? How to make homemade mac 'n' cheese that is a"
          's satisfyingly gooey and velvety-smooth as the blue box stuff,'
          ' but far tastier? How to roast a succulent, moist turkey (forg'
          'et about brining!)--and use a foolproof method that works ever'
          'y time?',
      srcImage: 'assets/img/books/the food lab.jpg',
      likes: 7891,
      rate: 4.4,
      views: 9012,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title:
          "The Ultimate Hitchhiker's Guide to the Galaxy: Five Novels in One "
          'Outrageous',
      author: 'Douglas Adams',
      category: 'Science',
      description:
          'Seconds before the Earth is demolished for a galactic freeway, Ar'
          'thur Dent is saved by Ford Prefect, a researcher for the revis'
          'ed Guide. Together they stick out their thumbs to the stars a'
          'nd begin a wild journey through time and space',
      srcImage:
          'assets/img/books/the ultimate hitchhikers guide to the galaxy.jpg',
      likes: 3002,
      rate: 4.7,
      views: 3891,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Book of Why: The New Science of Cause and Effect',
      author: 'Judea Pearl',
      category: 'Science',
      description:
          'Review One of Science Friday\'s "Best Science Books of 2018""Ill'
          'uminating... The Professor Pearl who emerges from the ui '
          'of The Book of Why brims with the joy of discovery and pride'
          ' in his students and colleagues... [it] not only delivers a v'
          'aluable lesson on the history of ideas but provides the conce'
          'ptual tools needed to judge just what big models can and cannot '
          'deliver."―New York Times "Cause and effect is one of the most he'
          'avily debated, difficult-to-prove things in science and medicine'
          '. This book',
      srcImage: 'assets/img/books/the book of why.jpg',
      likes: 4200,
      rate: 4.1,
      views: 4891,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Breath: The New Science of a Lost Art',
      author: 'James Nestor',
      category: 'Science',
      description:
          'There is nothing more essential to our health and well-being than '
          'breathing: take air in, let it out, repeat twenty-five thousand '
          'times a day. Yet, as a species, humans have lost the ability to'
          ' breathe correctly, with grave consequences.',
      srcImage: 'assets/img/books/breath.jpg',
      likes: 5921,
      rate: 4.4,
      views: 6091,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Shining ',
      author: 'Stephen King',
      category: 'Thriller',
      description:
          "Jack Torrance's new job at the Overlook Hotel is the perfect chance"
          ' for a fresh start. As the off-season caretaker at the atmosph'
          "eric old hotel, he'll have plenty of time to spend reconnect"
          'ing with his family and working on his writing. But as the har'
          'sh winter weather sets in, the idyllic location feels ever mo'
          're remote . . . and more sinister. And the only one to notice t'
          'he strange and terrible forces gathering around the Overlook i'
          's Danny Torrance, a uniquely gifted five-year-old',
      srcImage: 'assets/img/books/the shining.jpg',
      likes: 15291,
      rate: 4.7,
      views: 17490,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'The Dancing Girls: An absolutely gripping crime thriller with nai'
          'l-biting suspense',
      author: 'M M Chouinard',
      category: 'Thriller',
      description:
          'The light in her wide brown eyes dimmed as she drew her last brea'
          'h. She might have been beautiful lying there on the floor, i'
          "f it wasn't for the purple marks on her neck and the angry r"
          'ed line on her finger where her wedding band used to be...',
      srcImage: 'assets/img/books/the dancing girls.jpg',
      likes: 13291,
      rate: 4.7,
      views: 14490,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
    Book(
      title: 'Poisoned',
      author: 'Aime Austin',
      category: 'Thriller',
      description:
          'The quaint village of Brighthill in the southernmost part of Cuyah'
          'oga County is a bucolic Cleveland suburb bordered by a nature '
          'conservancy. But the green trees and greener grass are hidin'
          'g a secret underneath. The well water that pours from the ta'
          'ps is being poisoned. Dozens of kids are battling childhood can'
          'cer but the cause is unknown until one attorney brings them to'
          'gether for the biggest class action in decades',
      srcImage: 'assets/img/books/poisoned.jpg',
      likes: 12091,
      rate: 4.5,
      views: 13090,
      reviews: _generateReviews(),
      readers: _generateReaders(),
    ),
  ];

  static final _rnd = Random();
  static const _lorem =
      'Lorem ipsum dolor sit amet consectetur adipiscing elit sociis, sene'
      'ctus imperdiet litora porta parturient leo tincidunt, proin eget eui'
      'smod ornare habitasse accumsan primis. Integer curabitur mus bibendu'
      ' gravida lacus lacinia auctor ultrices malesuada hendrerit, et sem ar'
      'cu suscipit porttitor natoque urna donec risus, libero ligula molesti'
      'e taciti elementum fames eleifend praesent nec. Mus torquent lobortis'
      ' potenti elementum pretium nascetur et hac vestibulum duis, eleifend po'
      'rta magnis laoreet sollicitudin dui tristique molestie arcu fermentum,'
      ' himenaeos lectus eget semper dignissim ut feugiat facilisi vehicula';

  //--------------------------------------------------------
  // Aux method for generate the readers of the book.
  //--------------------------------------------------------
  static List<UserBook> _generateReaders() {
    const users = UserBook.users2;
    return List.generate(_rnd.nextInt(30), (index) {
      return users[index % users.length];
    });
  }

  //--------------------------------------------------------
  // Aux method for generate the reviews models of the book.
  //--------------------------------------------------------
  static List<Review> _generateReviews() {
    const users = UserBook.users1;
    return List.generate(
      _rnd.nextInt(400),
      (index) {
        return Review(
          authorReview: users[index % users.length],
          review: _lorem,
          likes: _rnd.nextInt(40),
          replies: _rnd.nextInt(20),
          date: DateTime.now(),
        );
      },
    );
  }
}
