import 'app_strings.dart';

class AppStringsEn extends AppStrings {
  @override
  String get appTitle => 'MoSalahDev';
  @override
  String get portfolioTitle => 'MoSalahDev';

  @override
  String get sections => 'Sections';
  @override
  String get navHome => 'Home';
  @override
  String get navProjects => 'Projects';
  @override
  String get navAbout => 'About';
  @override
  String get navSkills => 'Skills';
  @override
  String get navContact => 'Contact';

  @override
  String get switchLight => 'Switch to light theme';
  @override
  String get switchDark => 'Switch to dark theme';
  @override
  String get language => 'Language';
  @override
  String get homeLabel => 'Home';
  @override
  String get aboutLabel => 'About';
  @override
  String get devProcesLabel => 'Dev Process';
  @override
  String get skillsLabel => 'Skills';
  @override
  String get projectsLabel => 'Projects';
  @override
  String get contactLabel => 'Contact';
  @override
  String get navigatetooltip => 'Navigate';

  @override
  String get heroSectionTitle => 'Mobile App Developer';
  @override
  String get schortname => 'MoSalah';
  @override
  String get schortname2 => 'Dev.';
  @override
  String get homeTitleFirstPart => "Hi, I'm Mohamed\nSalah Djehel";
  // @override
  // String get homeTitleSecondPart => '';
  @override
  String get role => 'Mobile Application Developer';
  @override
  String get viewMyWork => 'View My Work';
  @override
  String get hireMe => 'Hire Me';
  @override
  String get hookText =>
      'I build real-world applications with clean architecture, strong logic, and a focus on performance.';
  @override
  String get openTowork =>
      'Open to development opportunities and professional growth';
  @override
  String get typewriterText1 => 'Mobile Application Developer.';
  @override
  String get typewriterText2 => 'Flutter Developer.';
  @override
  String get typewriterText3 => 'Android Developer.';
  @override
  String get typewriterText4 => 'Cross-Platform Developer.';

  @override
  String get developmentProcessTitle => 'Development Process';
  @override
  String get developmentProcessSubtitle =>
      'From concept to code, crafting seamless, high-performance apps with precision and creativity.';
  @override
  String get developmentProcessDescription =>
      '**Building apps** that don\'t just work but deliver **exceptional experiences** is at the heart of my work as a **Flutter Developer**. I focus on **clean, scalable code**, transforming **complex designs** into **seamless, high-performance interfaces**. By **optimizing state management and resources**, I create **integrated apps** that run **efficiently across platforms**, ensuring **responsiveness, stability, and measurable technical impact**.';

  @override
  String get skillsTitle => 'Skillset';
  @override
  String get skillsSubtitle =>
      'A comprehensive overview of my technical expertise and professional workflow.';

  @override
  String get toolsTitle => 'Toolbox';
  @override
  String get toolsSubtitle =>
      'Essential tools I use daily to design, build, and ship robust Flutter experiences.';

  @override
  String get categoryMobileDev => 'MOBILE\nDEVELOPMENT';
  @override
  String get categoryStateManagement => 'STATE\nMANAGEMENT';
  @override
  String get categoryBackendIntegration => 'BACKEND\nINTEGRATION';
  @override
  String get categoryUiPerformance => 'UI &\nPERFORMANCE';

  @override
  List<String> get skillsMobileDev => [
    'Flutter & Dart',
    'Clean Architecture',
    'Git Workflows',
    'Modular Apps',
    'App Scaling',
  ];

  @override
  List<String> get skillsStateManagement => [
    'BLoC / Cubit',
    'GetX Environment',
    'Provider',
    'Dependency Injection',
    'State Persistence',
  ];

  @override
  List<String> get skillsBackendIntegration => [
    'Supabase',
    'REST APIs',
    'Auth Systems',
    'Secure Storage',
    'Error Handling',
  ];

  @override
  List<String> get skillsUiPerformance => [
    'Performance Tuning',
    'App Optimization',
    'Fluid UI Animations',
    'Responsive UI',
    'Design Systems',
  ];

  @override
  String get aboutTitle => 'About Me';
  @override
  String get aboutSubTitle =>
      'Overview of my background and approach to building high-quality mobile apps.';
  @override
  String get aboutDescription =>
      "Mohamed Salah is a Mobile Application Developer.\n\nFocused on building structured and high-quality mobile applications with Flutter, he develops real-world projects that emphasize clean architecture, performance, and intuitive user experiences. His work centers on transforming ideas into reliable applications through disciplined problem-solving, organized development practices, and continuous technical improvement.\n\nHe specializes in creating scalable app structures, implementing modern UI solutions, and maintaining clean, maintainable codebases. Passionate about practical learning and product quality, he aims to contribute to professional development teams while growing through real production challenges and collaborative environments.";

  @override
  String get resumeButton => 'View Resume';
  @override
  String get linkedInButton => 'LinkedIn';

  @override
  String get resumeUrl =>
      'assets/lib/core/assets/cv/Mohamed_Saleh_Flutter_Developer_CV.pdf';
  @override
  String get linkedInUrl => 'https://www.linkedin.com/in/mohamedsalahdjehel/';

  @override
  String get projectsTitle => 'Selected Projects';
  @override
  String get moreDetailsLabel => 'more details';
  @override
  String get projectsSubtitle =>
      'Real-world Flutter apps built with clean architecture, performance, and strong UX focus.';

  @override
  String get projectNewsilyTitle => 'Newsily';
  @override
  String get projectNewsilyOverview =>
      'Newsily is a mobile application that aggregates news from multiple international newspapers and media sources through a news API, allowing users to stay informed without the need to visit several websites individually. The app is designed to provide a quick daily overview of important news while saving time and reducing information overload.\n\nNewsily is intended for users who regularly follow news but want a centralized, organized, and efficient way to access articles from different sources in one place.';
  @override
  String get projectNewsilyCoreFeatures =>
      '- News aggregation from multiple global sources via API\n- Category-based browsing for focused reading\n- Daily automatic updates\n- Article search functionality\n- Save articles for later reading\n- Offline access through local caching\n- Light and dark mode for comfortable reading\n';
  @override
  String get projectNewsilyTechStack =>
      'Flutter for cross-platform mobile development\nNews API for fetching news data\nBloc (Cubit) for state management\nSQLite (sqflite) for local data storage and caching\n';
  @override
  String get projectNewsilyChallenges =>
      'To optimize performance and reduce unnecessary API requests, news data is fetched only when updates are required. The application checks whether new data is available and avoids re-fetching unchanged content. A time-based validation mechanism ensures that data is refreshed only after a defined interval (e.g. every 12 hours), significantly reducing API usage and improving efficiency.\n\nThe project follows Clean Architecture principles to keep the codebase modular, readable, and easy to maintain or extend in future updates.';
  @override
  String get projectNewsilyRole =>
      'Project concept and feature definition.\nUI/UX planning and design decisions.\nFull application development from scratch.\nArchitectural and technical decision-making.\nPerformance optimization and functional testing.\n';
  @override
  String get projectNewsilyProjectStatus =>
      'The application is complete, stable, and fully functional.\nA direct APK download link is provided below in "Download & Link" section.';

  @override
  String get projectRaqibTitle => 'Raqib';
  @override
  String get projectRaqibOverview =>
      'Raqib is a mobile application designed to empower users to report trade violations directly to the Ministry of Trade.\n\nThe application streamlines the reporting process, allowing users to submit detailed reports, track the progress of each report, and stay informed about official updates.\n\nThe main goal is to provide a transparent, efficient, and user-friendly reporting system, making it easier for citizens to participate in regulatory compliance.';
  @override
  String get projectRaqibCoreFeatures =>
      '- User Authentication: Secure sign-in options including email/password, Google, and anonymous access.\n- Report Submission:\n- Users can report violations by selecting the type of violation.\n- Reports are stored in Supabase and synchronized in real-time.\n- Report Tracking:\n- Users can follow the progress of each report across multiple stages.\n- Admins can update the stage of a report, which is immediately reflected to the user.\n- Offline Support: Users can fill reports offline and submit when connection is available.\n- Multi-language Support: Arabic, English, French.\n- Light/Dark Mode for better usability.\n';
  @override
  String get projectRaqibTechStack =>
      'Flutter for cross-platform development.\nState Management: GetX for reactive and organized state handling.\nBackend: Supabase for database management, authentication, and real-time updates.\nArchitecture: Clean separation between UI, business logic, and data layers.\n';
  @override
  String get projectRaqibChallenges =>
      'Real-time updates: Ensuring that both users and admins see report status changes instantly.\nSolution: Leveraged Supabase’s real-time features combined with GetX reactive state management.\n';
  @override
  String get projectRaqibRole =>
      'Designed and implemented the full project architecture.\nDeveloped UI and UX flow.\nIntegrated Supabase for authentication, database, and real-time features.\nPlanned the stages of reporting and tracking logic.\nOversaw testing, bug fixing, and performance optimization.\n';
  @override
  String get projectRaqibProjectStatus =>
      'Fully functional and stable.\nAPK download link included below in "Download & Link" section.';

  @override
  String get projectQuranLifeTitle => 'QuranLife';
  @override
  String get projectQuranLifeOverview =>
      'QuranLife is a comprehensive mobile application designed to support Muslims in practicing their religious duties easily and consistently, anywhere and at any time.\n\nThe application combines multiple essential Islamic features into a single, well-structured platform, eliminating the need to rely on several separate apps.\n\nThe focus of the project is practicality, performance, and usability in both online and offline scenarios.';
  @override
  String get projectQuranLifeCoreFeatures =>
      '- Holy Quran: Reading and listening with offline support.\n- Adhkar & Duas: Organized by categories and usage contexts.\n- Prayer Times:\n- Prayer times fetched from an external API.\n- Accurate calculation of the current prayer, next prayer, and remaining time.\n- Time-based logic that adapts dynamically throughout the day.\n- Adhan & Prayer Notifications.\n- Qibla Direction.\n- Digital Tasbih.\n- Mosque Locator:\n- Google Maps integration.\n- Custom filtering to display places of worship only.\n- Multi-language Support: Arabic, English, and French.\n- Light & Dark Mode.\n- Key Differentiators:\n- In addition to standard Islamic utilities, QuranLife includes advanced interactive features that are uncommon in similar applications:\n- User Authentication: Secure sign-up and login system.\n- Real-time Chat: Users can communicate with each other inside the application using live messaging.\n- AI-powered Islamic History Assistant:\n- Integration with an AI API dedicated to answering questions related to Islamic history.\n- Designed to act as a focused historical assistant rather than a general chatbot.\n- These features transform the application from a static tool into a community-oriented platform.';
  @override
  String get projectQuranLifeTechStack =>
      'Flutter for cross-platform development.\nState Management: GetX.\nBackend: Firebase for database management, authentication, and Real-time chat using Cloud Firestore.\nAPIs: Prayer Times API, Google Maps API with customized filtering logic, AI API for Islamic History.\nLocal Storage: SharedPreferences, SQLite, Offline-first Architecture for core functionalities.';
  @override
  String get projectQuranLifeChallenges =>
      'One of the most complex aspects of the project was prayer time handling and time-based logic, which required processing daily prayer data received from an external API, determining the current and upcoming prayers accurately, and calculating remaining time dynamically. To manage complexity, the application architecture was divided into independent controllers, each responsible for a specific feature, improving clarity and scalability.';
  @override
  String get projectQuranLifeRole =>
      'Project concept and feature definition.\nUI/UX planning and design decisions.\nFull application development from scratch.\nArchitectural and technical decision-making.\nPerformance optimization and functional testing.\nThe application was developed independently.';
  @override
  String get projectQuranLifeProjectStatus =>
      'The application is complete, stable, and fully functional. A direct APK download link is provided in the "Download & Link" section below.';

  @override
  String get contactTitle => 'Contact';
  @override
  String get interestedInWorking =>
      'Feel free to hit me up. I’m looking forward to hearing from you.';
  @override
  String get emailCopied => 'Email copied to clipboard';

  @override
  String get footerText =>
      'Mohamed Salah Djehel · Portfolio · Mobile Applications Developer';
  @override
  String get rightText => '© 2026 · All rights reserved';

  @override
  String get externallinksnackbarmessag => 'Unable to open link.';
  @override
  String get downloadNotStart => 'Could not start download.';
  @override
  String get urlNotOpen => 'Unable to open link.';
  @override
  String get pageNotOpen => 'Could not open page.';
  @override
  String get status => 'Status';
  @override
  String get corefeaturestitle => 'Core Features';
  @override
  String get downloadandlinkstitle => 'Download & Links';
  @override
  String get downloadApkLabel => 'Download APK.';
  @override
  String get vieOnGithub => 'View on GitHub';
  @override
  String get getOnApptoid => 'Get on Apptoide';
  @override
  String get roleTitle => 'Role';
  @override
  String get overviewTitle => 'Overview';
  @override
  String get chalengesTitel => 'Challenges & Solutions';
  @override
  String get techStackTitle => 'Tech Stack';
  @override
  String get screenSchotsTitle => 'Screenshots';
}
