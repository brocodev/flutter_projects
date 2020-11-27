
class ExternalPlatform {
  final String name;
  final String urlLauncher;
  final String imagePath;
  final bool haveDarkImage;

  const ExternalPlatform._(
      {this.name, this.urlLauncher, this.imagePath, this.haveDarkImage});

  static const kDiscord = ExternalPlatform._(
    name: "Discord",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/discord.png',
  );

  static const kFacebook = ExternalPlatform._(
    name: "Facebook",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/facebook.png',
  );

  static const kGitHub = ExternalPlatform._(
    name: "GitHub",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/github.png',
  );
  static const kTwitch = ExternalPlatform._(
    name: "twitch",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitch.png',
  );
  static const kUnsplash = ExternalPlatform._(
    name: "Unsplash",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/unsplash.png',
  );

  static const kInstagram = ExternalPlatform._(
    name: "Unsplash",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/instagram.png',
  );

  static const kSnapchat = ExternalPlatform._(
    name: "Snapchat",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/snapchat.png',
  );

  static const kTwitter = ExternalPlatform._(
    name: "Twitter",
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitter.png',
  );

  static const kUplabs = ExternalPlatform._(
    name: "Uplabs",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/uplabs.png',
  );

  static const kYoutube = ExternalPlatform._(
    name: "YouTube",
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/youtube.png',
  );
}
