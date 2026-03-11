class ToolAsset {
  final String name;
  final String path;
  final bool isSvg;
  final String url;

  const ToolAsset(this.name, this.path, {required this.url, this.isSvg = true});
}

const List<ToolAsset> toolAssets = [
  ToolAsset(
    'Android Studio',
    'lib/assets/photos/tools_icons/androidstudio.svg',
    url: 'https://developer.android.com/studio',
  ),
  ToolAsset(
    'REST API',
    'lib/assets/photos/tools_icons/api.svg',
    url: 'https://restfulapi.net',
  ),
  ToolAsset(
    'Supabase',
    'lib/assets/photos/tools_icons/supabase.svg',
    url: 'https://supabase.com',
  ),
  ToolAsset(
    'Dart',
    'lib/assets/photos/tools_icons/dart.svg',
    url: 'https://dart.dev',
  ),
  ToolAsset(
    'DotENV',
    'lib/assets/photos/tools_icons/dotenv.svg',
    url: 'https://pub.dev/packages/flutter_dotenv',
  ),
  ToolAsset(
    'Figma',
    'lib/assets/photos/tools_icons/figma.svg',
    url: 'https://www.figma.com',
  ),
  ToolAsset(
    'Firebase',
    'lib/assets/photos/tools_icons/firebase.svg',
    url: 'https://firebase.google.com',
  ),
  ToolAsset(
    'Flutter',
    'lib/assets/photos/tools_icons/flutter.svg',
    url: 'https://flutter.dev',
  ),
  ToolAsset(
    'GetX',
    'lib/assets/photos/tools_icons/getx.svg',
    url: 'https://pub.dev/packages/get',
  ),
  ToolAsset(
    'Git',
    'lib/assets/photos/tools_icons/git.svg',
    url: 'https://git-scm.com',
  ),
  ToolAsset(
    'GitHub',
    'lib/assets/photos/tools_icons/github.svg',
    url: 'https://github.com',
  ),
  ToolAsset(
    'GitHub Copilot',
    'lib/assets/photos/tools_icons/githubcopilot.svg',
    url: 'https://github.com/features/copilot',
  ),
  ToolAsset(
    'Google Cloud',
    'lib/assets/photos/tools_icons/googlecloud.svg',
    url: 'https://cloud.google.com',
  ),
  ToolAsset(
    'Google Fonts',
    'lib/assets/photos/tools_icons/googlefonts.svg',
    url: 'https://fonts.google.com',
  ),
  ToolAsset(
    'Gemini',
    'lib/assets/photos/tools_icons/googlegemini.svg',
    url: 'https://ai.google.dev/gemini-api',
  ),
  ToolAsset(
    'Maps',
    'lib/assets/photos/tools_icons/googlemaps.svg',
    url: 'https://mapsplatform.google.com',
  ),
  ToolAsset(
    'Postman',
    'lib/assets/photos/tools_icons/postman.svg',
    url: 'https://www.postman.com',
  ),
  ToolAsset(
    'Python',
    'lib/assets/photos/tools_icons/python.svg',
    url: 'https://www.python.org',
  ),
  ToolAsset(
    'Sdk',
    'lib/assets/photos/tools_icons/sdk.png',
    url: 'https://developer.android.com/studio#downloads',
    isSvg: false,
  ),
  ToolAsset(
    'Sqlite',
    'lib/assets/photos/tools_icons/sqlite.svg',
    url: 'https://www.sqlite.org',
  ),
];
