import '../constants/app_strings.dart';

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

  static List<Project> get allProjects => [
    Project(
      title: AppStrings.projectNewsilyTitle,
      overview: AppStrings.projectNewsilyOverview,
      coreFeatures: AppStrings.projectNewsilyCoreFeatures,
      techStack: AppStrings.projectNewsilyTechStack,
      challenges: AppStrings.projectNewsilyChallenges,
      role: AppStrings.projectNewsilyRole,
      status: AppStrings.projectNewsilyProjectStatus,
      logo: 'lib/assets/photos/newsily/newsily_logo_png.png',
      screenshots: [
        'lib/assets/photos/newsily/1.jpg',
        'lib/assets/photos/newsily/2.jpg',
        'lib/assets/photos/newsily/3.jpg',
        'lib/assets/photos/newsily/4.jpg',
        'lib/assets/photos/newsily/5.jpg',
        'lib/assets/photos/newsily/6.jpg',
        'lib/assets/photos/newsily/7.jpg',
      ],
      imageOverview: 'lib/assets/photos/newsily/newsily_overview.png',
      apkDownloadUrl:
          'https://github.com/MosalahDJ/Newsily/releases/download/v1.4.2/app-release.apk',
      githubUrl: 'https://github.com/MosalahDJ/Newsili',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
    Project(
      title: AppStrings.projectRaqibTitle,
      overview: AppStrings.projectRaqibOverview,
      coreFeatures: AppStrings.projectRaqibCoreFeatures,
      techStack: AppStrings.projectRaqibTechStack,
      challenges: AppStrings.projectRaqibChallenges,
      role: AppStrings.projectRaqibRole,
      status: AppStrings.projectRaqibProjectStatus,
      logo: 'lib/assets/photos/raqib/newlogo.jpg',
      screenshots: [
        'lib/assets/photos/raqib/1.jpg',
        'lib/assets/photos/raqib/2.jpg',
        'lib/assets/photos/raqib/3.jpg',
        'lib/assets/photos/raqib/4.jpg',
        'lib/assets/photos/raqib/5.jpg',
        'lib/assets/photos/raqib/6.jpg',
        'lib/assets/photos/raqib/7.jpg',
        'lib/assets/photos/raqib/8.jpg',
        'lib/assets/photos/raqib/9.jpg',
        'lib/assets/photos/raqib/10.jpg',
      ],
      imageOverview: 'lib/assets/photos/raqib/raqib_overvie.png',
      apkDownloadUrl:
          'https://github.com/MosalahDJ/Raqib/releases/download/1.0.1/app-release.apk',
      githubUrl: 'https://github.com/MosalahDJ/raqib',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
    Project(
      title: AppStrings.projectQuranLifeTitle,
      overview: AppStrings.projectQuranLifeOverview,
      coreFeatures: AppStrings.projectQuranLifeCoreFeatures,
      techStack: AppStrings.projectQuranLifeTechStack,
      challenges: AppStrings.projectQuranLifeChallenges,
      role: AppStrings.projectQuranLifeRole,
      status: AppStrings.projectQuranLifeProjectStatus,
      logo: 'lib/assets/photos/quranLife/newlogo512.png',
      screenshots: [
        'lib/assets/photos/quranLife/0.png',
        'lib/assets/photos/quranLife/1.png',
        'lib/assets/photos/quranLife/2.png',
        'lib/assets/photos/quranLife/3.png',
        'lib/assets/photos/quranLife/4.jpg',
        'lib/assets/photos/quranLife/5.png',
        'lib/assets/photos/quranLife/6.jpg',
        'lib/assets/photos/quranLife/7.png',
        'lib/assets/photos/quranLife/8.png',
        'lib/assets/photos/quranLife/9.png',
        'lib/assets/photos/quranLife/10.jpg',
        'lib/assets/photos/quranLife/11.png',
        'lib/assets/photos/quranLife/12.png',
      ],
      imageOverview: 'lib/assets/photos/quranLife/quranlife_overview.png',
      apkDownloadUrl:
          'https://github.com/MosalahDJ/QuranLife/releases/download/1.0.5/app-release.apk',
      githubUrl: 'https://github.com/MosalahDJ/QuranLife',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
  ];
}
