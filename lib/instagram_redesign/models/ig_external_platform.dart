class ExternalPlatform {
  final String name;
  String urlLauncher;
  final String imagePath;
  final bool haveDarkImage;

  ExternalPlatform._(
      {this.name, this.urlLauncher, this.imagePath, this.haveDarkImage});

  static final kDiscord = ExternalPlatform._(
    name: "Discord",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/discord.png',
  );

  static final kFacebook = ExternalPlatform._(
    name: "Facebook",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/facebook.png',
  );

  static final kGitHub = ExternalPlatform._(
    name: "GitHub",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/github.png',
  );
  static final kTwitch = ExternalPlatform._(
    name: "twitch",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitch.png',
  );
  static final kUnsplash = ExternalPlatform._(
    name: "Unsplash",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/unsplash.png',
  );

  static final kInstagram = ExternalPlatform._(
    name: "Unsplash",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/instagram.png',
  );

  static final kSnapchat = ExternalPlatform._(
    name: "Snapchat",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/snapchat.png',
  );

  static final kTwitter = ExternalPlatform._(
    name: "Twitter",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitter.png',
  );

  static final kUplabs = ExternalPlatform._(
    name: "Uplabs",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/uplabs.png',
  );

  static final kYoutube = ExternalPlatform._(
    name: "YouTube",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/youtube.png',
  );
}
