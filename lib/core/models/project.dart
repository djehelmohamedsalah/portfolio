import '../localization/app_strings.dart';

class Project {
  final String title;
  final String overview;
  final String coreFeatures;
  final String techStack;
  final String challenges;
  final String role;
  final String status;
  final String logo;
  final String imageOverview;
  final List<String> screenshots;
  final String? apkDownloadUrl;
  final String? githubUrl;
  final String? aptoideUrl;

  Project({
    required this.title,
    required this.overview,
    required this.coreFeatures,
    required this.techStack,
    required this.challenges,
    required this.role,
    required this.status,
    required this.logo,
    required this.imageOverview,

    this.screenshots = const [],
    this.apkDownloadUrl,
    this.githubUrl,
    this.aptoideUrl,
  });

  static List<Project> fromStrings(AppStrings strings) => [
    Project(
      title: strings.projectNewsilyTitle,
      overview: strings.projectNewsilyOverview,
      coreFeatures: strings.projectNewsilyCoreFeatures,
      techStack: strings.projectNewsilyTechStack,
      challenges: strings.projectNewsilyChallenges,
      role: strings.projectNewsilyRole,
      status: strings.projectNewsilyProjectStatus,
      logo: 'lib/core/assets/photos/newsily/newsily_logo_png.png',
      screenshots: [
        'lib/core/assets/photos/newsily/0.png',
        'lib/core/assets/photos/newsily/1.jpg',
        'lib/core/assets/photos/newsily/2.jpg',
        'lib/core/assets/photos/newsily/3.jpg',
        'lib/core/assets/photos/newsily/4.jpg',
        'lib/core/assets/photos/newsily/5.jpg',
        'lib/core/assets/photos/newsily/6.jpg',
        'lib/core/assets/photos/newsily/7.jpg',
      ],
      imageOverview: 'lib/core/assets/photos/newsily/newsily_overview.png',
      apkDownloadUrl:
          'https://github.com/djehelmohamedsalah/Newsily/releases/download/v1.4.2/app-release.apk',
      githubUrl: 'https://github.com/djehelmohamedsalah/Newsily',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
    Project(
      title: strings.projectRaqibTitle,
      overview: strings.projectRaqibOverview,
      coreFeatures: strings.projectRaqibCoreFeatures,
      techStack: strings.projectRaqibTechStack,
      challenges: strings.projectRaqibChallenges,
      role: strings.projectRaqibRole,
      status: strings.projectRaqibProjectStatus,
      logo: 'lib/core/assets/photos/raqib/newlogo.jpg',
      screenshots: [
        'lib/core/assets/photos/raqib/0.png',
        'lib/core/assets/photos/raqib/1.jpg',
        'lib/core/assets/photos/raqib/2.jpg',
        'lib/core/assets/photos/raqib/3.jpg',
        'lib/core/assets/photos/raqib/4.jpg',
        'lib/core/assets/photos/raqib/5.jpg',
        'lib/core/assets/photos/raqib/6.jpg',
        'lib/core/assets/photos/raqib/7.jpg',
        'lib/core/assets/photos/raqib/8.jpg',
        'lib/core/assets/photos/raqib/9.jpg',
        'lib/core/assets/photos/raqib/10.jpg',
      ],
      imageOverview: 'lib/core/assets/photos/raqib/raqib_overvie.png',
      apkDownloadUrl:
          'https://github.com/djehelmohamedsalah/Raqib/releases/download/1.0.1/app-release.apk',
      githubUrl: 'https://github.com/djehelmohamedsalah/raqib',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
    Project(
      title: strings.projectQuranLifeTitle,
      overview: strings.projectQuranLifeOverview,
      coreFeatures: strings.projectQuranLifeCoreFeatures,
      techStack: strings.projectQuranLifeTechStack,
      challenges: strings.projectQuranLifeChallenges,
      role: strings.projectQuranLifeRole,
      status: strings.projectQuranLifeProjectStatus,
      logo: 'lib/core/assets/photos/quranLife/newlogo512.png',
      screenshots: [
        'lib/core/assets/photos/quranLife/0.png',
        'lib/core/assets/photos/quranLife/1.png',
        'lib/core/assets/photos/quranLife/2.png',
        'lib/core/assets/photos/quranLife/3.png',
        'lib/core/assets/photos/quranLife/4.jpg',
        'lib/core/assets/photos/quranLife/5.png',
        'lib/core/assets/photos/quranLife/6.jpg',
        'lib/core/assets/photos/quranLife/7.png',
        'lib/core/assets/photos/quranLife/8.png',
        'lib/core/assets/photos/quranLife/9.png',
        'lib/core/assets/photos/quranLife/10.jpg',
        'lib/core/assets/photos/quranLife/11.png',
        'lib/core/assets/photos/quranLife/12.png',
      ],
      imageOverview: 'lib/core/assets/photos/quranLife/quranlife_overview.png',
      apkDownloadUrl:
          'https://github.com/djehelmohamedsalah/QuranLife/releases/download/1.0.5/app-release.apk',
      githubUrl: 'https://github.com/djehelmohamedsalah/QuranLife',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
  ];
}
