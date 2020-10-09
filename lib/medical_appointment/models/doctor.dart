class Doctor {
  final String name;
  final String category;
  final int patients;
  final double rate;
  final int likes;
  final int comments;
  final String topDoctorImageUrl;
  final String imageUrl;

  Doctor({
    this.name,
    this.category,
    this.patients,
    this.rate,
    this.likes,
    this.comments,
    this.topDoctorImageUrl,
    this.imageUrl,
  });

  static final listTopDoctor = [
    Doctor(
      name: 'Iris Bohorquez',
      category: 'Surgeon',
      comments: 203,
      topDoctorImageUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-Free-PNG-Image.png',
      likes: 359,
      rate: 4.7,
      patients: 402,
    ),
    Doctor(
      name: 'Namor Scoutia',
      category: 'Cardiologist',
      comments: 193,
      topDoctorImageUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-Free-Download-PNG.png',
      likes: 301,
      rate: 4.5,
      patients: 320,
    ),
    Doctor(
      name: 'Alex Gospel',
      category: 'Urologist',
      comments: 210,
      topDoctorImageUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor.png',
      likes: 324,
      rate: 4.6,
      patients: 352,
    ),
    Doctor(
      name: 'Robert Peace',
      category: 'Pediatician',
      comments: 173,
      topDoctorImageUrl:
      'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-PNG-File-Download-Free.png',
      likes: 239,
      rate: 4.8,
      patients: 298,
    ),
  ];
}
