class Song {
  final int id;
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      id: 1,
      title: 'Enne Satham',
      description: 'Punnagai Mannan',
      url: 'assets/songs/song1.mp3',
      coverUrl: 'assets/images/song_image1.jpeg',
    ),
    Song(
      id: 2,
      title: 'Vaa Vennila',
      description: 'Mella Thiranthathu Kathavu',
      url: 'assets/songs/song2.mp3',
      coverUrl: 'assets/images/song_image2.jpeg',
    ),
    Song(
      id: 3,
      title: 'Idhayam Oru Kovil',
      description: 'Idhayam Kovil',
      url: 'assets/songs/song3.mp3',
      coverUrl: 'assets/images/song_image3.jpeg',
    ),
    Song(
      id: 4,
      title: 'Nilaave Vaa',
      description: 'Mouna Raagam',
      url: 'assets/songs/song4.mp3',
      coverUrl: 'assets/images/song_image4.jpeg',
    ),
    Song(
      id: 5,
      title: 'Malaiyoram',
      description: 'Paadu Nilave',
      url: 'assets/songs/song5.mp3',
      coverUrl: 'assets/images/song_image5.jpeg',
    ),
    Song(
      id: 6,
      title: 'Nilavu Thoongum',
      description: 'Udhaya Geetham',
      url: 'assets/songs/song6.mp3',
      coverUrl: 'assets/images/song_image6.jpeg',
    ),
    Song(
      id: 7,
      title: 'Thene Thenpaadi',
      description: 'Paadu Nilave',
      url: 'assets/songs/song7.mp3',
      coverUrl: 'assets/images/song_image5.jpeg',
    ),
    Song(
      id: 8,
      title: 'Ethetho',
      description: 'Punnagai Mannan',
      url: 'assets/songs/song8.mp3',
      coverUrl: 'assets/images/song_image1.jpeg',
    ),
    Song(
      id: 9,
      title: 'Vetti Veru',
      description: 'Mudhal Mariyathai',
      url: 'assets/songs/song9.mp3',
      coverUrl: 'assets/images/song_image7.jpeg',
    ),
    Song(
      id: 10,
      title: 'Vellai Pura',
      description: 'Pudhu Kavithai',
      url: 'assets/songs/song10.mp3',
      coverUrl: 'assets/images/song_image8.jpeg',
    ),
    Song(
      id: 11,
      title: 'Raasathi Unne',
      description: 'Vaidhegi Kaathirunthal',
      url: 'assets/songs/song11.mp3',
      coverUrl: 'assets/images/song_image9.jpeg',
    ),
    Song(
      id: 12,
      title: 'Vannamkonda',
      description: 'Sigaram',
      url: 'assets/songs/song12.mp3',
      coverUrl: 'assets/images/song_image10.jpeg',
    ),
    Song(
      id: 13,
      title: 'Valaiyosai',
      description: 'Sathya',
      url: 'assets/songs/song13.mp3',
      coverUrl: 'assets/images/song_image11.jpeg',
    ),
    Song(
      id: 14,
      title: 'Vaa Vaa Anbe',
      description: 'Agni Nakshathiram',
      url: 'assets/songs/song14.mp3',
      coverUrl: 'assets/images/song_image12.jpeg',
    ),
    Song(
      id: 14,
      title: 'Thenpaadi Tamizhe',
      description: 'Paasa Paravaigal',
      url: 'assets/songs/song15.mp3',
      coverUrl: 'assets/images/song_image13.jpeg',
    )
  ];
}