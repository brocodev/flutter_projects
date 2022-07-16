enum ExternalPlatform {
  discord._(
    name: 'Discord',
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/discord.png',
  ),
  facebook._(
    name: 'Facebook',
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/facebook.png',
  ),
  gitHub._(
    name: 'GitHub',
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/github.png',
  ),
  twitch._(
    name: 'twitch',
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitch.png',
  ),
  unsplash._(
    name: 'Unsplash',
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/unsplash.png',
  ),
  instagram._(
    name: 'Unsplash',
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/instagram.png',
  ),
  snapchat._(
    name: 'Snapchat',
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/snapchat.png',
  ),
  twitter._(
    name: 'Twitter',
    haveDarkImage: true,
    imagePath: 'assets/img/instagram/twitter.png',
  ),
  uplabs._(
    name: 'Uplabs',
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/uplabs.png',
  ),
  youtube._(
    name: 'YouTube',
    haveDarkImage: false,
    imagePath: 'assets/img/instagram/youtube.png',
  );

  const ExternalPlatform._({
    this.name,
    this.imagePath,
    this.haveDarkImage,
  });

  final String? name;
  final String? imagePath;
  final bool? haveDarkImage;
}
