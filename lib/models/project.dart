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
      logo: 'lib/assets/photos/quranLife/newlogo.png',
      screenshots: [
        'lib/assets/photos/quranLife/0.png',
        'lib/assets/photos/quranLife/1.png',
        'lib/assets/photos/quranLife/2.png',
        'lib/assets/photos/quranLife/3.png',
        'lib/assets/photos/quranLife/4.png',
        'lib/assets/photos/quranLife/5.png',
        'lib/assets/photos/quranLife/6.png',
        'lib/assets/photos/quranLife/7.png',
        'lib/assets/photos/quranLife/8.png',
        'lib/assets/photos/quranLife/9.png',
      ],
      //TODO: add apk download url

      apkDownloadUrl:
          'https://github.com/yourusername/yourapp/releases/download/v1.0.0/app-release.apk',
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
      logo: 'lib/assets/photos/quranLife/newlogo.png',
      screenshots: [
        'lib/assets/photos/quranLife/0.png',
        'lib/assets/photos/quranLife/1.png',
        'lib/assets/photos/quranLife/2.png',
        'lib/assets/photos/quranLife/3.png',
        'lib/assets/photos/quranLife/4.png',
        'lib/assets/photos/quranLife/5.png',
        'lib/assets/photos/quranLife/6.png',
        'lib/assets/photos/quranLife/7.png',
        'lib/assets/photos/quranLife/8.png',
        'lib/assets/photos/quranLife/9.png',
      ],
      apkDownloadUrl:
      //TODO: add apk download url
          'https://github.com/yourusername/yourapp/releases/download/v1.0.0/app-release.apk',
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
      logo: 'lib/assets/photos/quranLife/newlogo.png',
      screenshots: [
        'lib/assets/photos/quranLife/0.png',
        'lib/assets/photos/quranLife/1.png',
        'lib/assets/photos/quranLife/2.png',
        'lib/assets/photos/quranLife/3.png',
        'lib/assets/photos/quranLife/4.png',
        'lib/assets/photos/quranLife/5.png',
        'lib/assets/photos/quranLife/6.png',
        'lib/assets/photos/quranLife/7.png',
        'lib/assets/photos/quranLife/8.png',
        'lib/assets/photos/quranLife/9.png',
      ],
      //TODO: add apk download url

      apkDownloadUrl:
          'https://github.com/yourusername/yourapp/releases/download/v1.0.0/app-release.apk',
      githubUrl: 'https://github.com/MosalahDJ/QuranLife',
      aptoideUrl: 'https://yourapp.en.aptoide.com/',
    ),
  ];
}
