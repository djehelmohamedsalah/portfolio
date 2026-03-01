class AppStrings {
  AppStrings._();

  static const String appTitle = 'MoSalahDev';
  static const String portfolioTitle = 'MoSalahDev';

  // Navigation
  static const String navHome = 'Home';
  static const String navProjects = 'Projects';
  static const String navAbout = 'About';
  static const String navSkills = 'Skills';
  static const String navContact = 'Contact';

  // Home Section
  static const String heroSectionTitle = 'Mobile App Developer';
  static const String schortname = 'MoSalah';
  static const String schortname2 = 'Dev.';
  static const String homeTitleFirstPart = 'Hi, I\'m Mohamed';
  static const String homeTitleSecondPart = 'Salah Djehel';
  static const String role = 'Mobile Application Developer';
  static const String viewMyWork = 'View My Work';
  static const String hireMe = 'Hire Me';
  static const String hookText =
      'I build real-world applications with clean architecture, strong logic, and a focus on performance.';

  // DevelopmentProcess Section
  static const String developmentProcessTitle = 'Development Process';
  static const String developmentProcessSubtitle =
      'From concept to code, crafting seamless, high-performance apps with precision and creativity.';
  static const String developmentProcessDescription =
      '**Building apps** that don\'t just work but deliver **exceptional experiences** is at the heart of my work as a **Flutter Developer**. I focus on **clean, scalable code**, transforming **complex designs** into **seamless, high-performance interfaces**. By **optimizing state management and resources**, I create **integrated apps** that run **efficiently across platforms**, ensuring **responsiveness, stability, and measurable technical impact**.';

  // Skills Section
  static const String skillsTitle = 'Skillset';
  static const String skillsSubtitle =
      'A comprehensive overview of my technical expertise and professional workflow.';
    // Tools Section
  static const String toolsTitle = 'Toolbox';
  static const String toolsSubtitle =
      'Essential tools I use daily to design, build, and ship robust Flutter experiences.';
  // Skills Categories
  static const String categoryMobileDev = 'MOBILE DEVELOPMENT';
  static const String categoryStateManagement = 'STATE MANAGEMENT';
  static const String categoryBackendIntegration = 'BACKEND INTEGRATION';
  static const String categoryUiPerformance = 'UI & PERFORMANCE';

  // Skills - Mobile Development
  static const List<String> skillsMobileDev = [
    'Flutter SDK & Dart Ecosystem',
    'Clean Architecture (SOLID)',
    'Advanced Git Workflows',
    'Modular Implementation',
    'CI/CD & App Distribution',
    'Production Scaling',
  ];

  // Skills - State Management
  static const List<String> skillsStateManagement = [
    'BLoC / Cubit Architecture',
    'GetX Reactive Management',
    'Dependency Injection Patterns',
    'Event-Driven Logic Flow',
    'Persistent State Handling',
    'Complex State Machines',
  ];

  // Skills - Backend Integration
  static const List<String> skillsBackendIntegration = [
    'Supabase & PostgreSQL',
    'RESTful API Engineering',
    'Multi-factor Auth Systems',
    'Real-time Data Syncing',
    'Secure Client Persistence',
    'Edge Case & Error Logic',
  ];

  // Skills - UI & Performance
  static const List<String> skillsUiPerformance = [
    'Performance Benchmarking',
    'Memory & Resource Profiling',
    'Custom Animation Engineering',
    'Responsive Design Systems',
    'Theming & Visual Standards',
    'Rendering Optimization',
  ];

  // About Section
  static const String aboutTitle = 'About Me';
  static const String aboutSubTitle =
      'A brief overview of my background, mindset, and approach to building structured, high-quality mobile applications.';

  static const String aboutDescription =
      "Mohamed Salah is a Software Developper\n\n"
      "focused on building clean, reliable, and scalable mobile applications. With over three years of hands-on experience, I work on real-world projects through a disciplined approach that combines learning, problem-solving, and practical execution.\n\n"
      "I turn ideas into well-structured applications from UI design to deployment, with a strong focus on clean code, efficient workflows, and continuous improvement.\n\n"
      "I thrive in collaborative and structured environments, value accountability and initiative, and am motivated to grow through mentorship and real responsibility—making me a strong fit for both Ausbildung programs and professional tech teams.\n";
  static const String resumeButton = 'Resume';
  static const String linkedInButton = 'LinkedIn';
  static const String resumeUrl = 'https://example.com/resume.pdf';
  static const String linkedInUrl = 'https://www.linkedin.com/in/your-profile/';
  // Projects Section
  static const String projectsTitle = 'Selected Projects';
  static const String projectsSubtitle =
      'A collection of real-world Flutter applications focused on clean architecture, performance, and user experience.';

  // Newsily app
  static const String projectNewsilyTitle = 'Newsily';
  static const String projectNewsilyOverview =
      'Newsily is a mobile application that aggregates news from multiple international newspapers and media sources through a news API, allowing users to stay informed without the need to visit several websites individually. The app is designed to provide a quick daily overview of important news while saving time and reducing information overload.\n\n'
      'Newsily is intended for users who regularly follow news but want a centralized, organized, and efficient way to access articles from different sources in one place.';
  static const String projectNewsilyCoreFeatures =
      '- News aggregation from multiple global sources via API\n'
      '- Category-based browsing for focused reading\n'
      '- Daily automatic updates\n'
      '- Article search functionality\n'
      '- Save articles for later reading\n'
      '- Offline access through local caching\n'
      '- Light and dark mode for comfortable reading\n';
  static const String projectNewsilyTechStack =
      'Flutter for cross-platform mobile development\n'
      'News API for fetching news data\n'
      'Bloc (Cubit) for state management\n'
      'SQLite (sqflite) for local data storage and caching\n';
  static const String projectNewsilyChallenges =
      'To optimize performance and reduce unnecessary API requests, news data is fetched only when updates are required. The application checks whether new data is available and avoids re-fetching unchanged content. A time-based validation mechanism ensures that data is refreshed only after a defined interval (e.g. every 12 hours), significantly reducing API usage and improving efficiency.\n'
      'The project follows Clean Architecture principles to keep the codebase modular, readable, and easy to maintain or extend in future updates.';
  static const String projectNewsilyRole =
      'Project concept and feature definition.\n'
      'UI/UX planning and design decisions.\n'
      'Full application development from scratch.\n'
      'Architectural and technical decision-making.\n'
      'Performance optimization and functional testing.\n';

  static const String projectNewsilyProjectStatus =
      'The application is complete, stable, and fully functional.\n'
      'A direct APK download link is provided below in "Download & Link" section.';

  // Raqib app
  static const String projectRaqibTitle = 'Raqib';
  static const String projectRaqibOverview =
      'Raqib is a mobile application designed to empower users to report trade violations directly to the Ministry of Trade.\n\n'
      'The application streamlines the reporting process, allowing users to submit detailed reports, track the progress of each report, and stay informed about official updates.\n\n'
      'The main goal is to provide a transparent, efficient, and user-friendly reporting system, making it easier for citizens to participate in regulatory compliance.';
  static const String projectRaqibCoreFeatures =
      '- User Authentication: Secure sign-in options including email/password, Google, and anonymous access.\n'
      '- Report Submission:\n'
      '- Users can report violations by selecting the type of violation.\n'
      '- Reports are stored in Supabase and synchronized in real-time.\n'
      '- Report Tracking:\n'
      '- Users can follow the progress of each report across multiple stages.\n'
      '- Admins can update the stage of a report, which is immediately reflected to the user.\n'
      '- Offline Support: Users can fill reports offline and submit when connection is available.\n'
      '- Multi-language Support: Arabic, English, French.\n'
      '- Light/Dark Mode for better usability.\n';
  static const String projectRaqibTechStack =
      'Flutter for cross-platform development.\n'
      'State Management: GetX for reactive and organized state handling.\n'
      'Backend: Supabase for database management, authentication, and real-time updates.\n'
      'Architecture: Clean separation between UI, business logic, and data layers.\n';
  static const String projectRaqibChallenges =
      'Real-time updates: Ensuring that both users and admins see report status changes instantly.\n'
      'Solution: Leveraged Supabase’s real-time features combined with GetX reactive state management.\n';
  static const String projectRaqibRole =
      'Designed and implemented the full project architecture.\n'
      'Developed UI and UX flow.\n'
      'Integrated Supabase for authentication, database, and real-time features.\n'
      'Planned the stages of reporting and tracking logic.\n'
      'Oversaw testing, bug fixing, and performance optimization.\n';
  static const String projectRaqibProjectStatus =
      'Fully functional and stable.\n'
      'APK download link included below in "Download & Link" section.';

  // QuranLife app
  static const String projectQuranLifeTitle = 'QuranLife';
  static const String projectQuranLifeOverview =
      'QuranLife is a comprehensive mobile application designed to support Muslims in practicing their religious duties easily and consistently, anywhere and at any time.\n\n'
      'The application combines multiple essential Islamic features into a single, well-structured platform, eliminating the need to rely on several separate apps.\n\n'
      'The focus of the project is practicality, performance, and usability in both online and offline scenarios.';
  static const String projectQuranLifeCoreFeatures =
      '- Holy Quran: Reading and listening with offline support.\n'
      '- Adhkar & Duas: Organized by categories and usage contexts.\n'
      '- Prayer Times:\n'
      '- Prayer times fetched from an external API.\n'
      '- Accurate calculation of the current prayer, next prayer, and remaining time.\n'
      '- Time-based logic that adapts dynamically throughout the day.\n'
      '- Adhan & Prayer Notifications.\n'
      '- Qibla Direction.\n'
      '- Digital Tasbih.\n'
      '- Mosque Locator:\n'
      '- Google Maps integration.\n'
      '- Custom filtering to display places of worship only.\n'
      '- Multi-language Support: Arabic, English, and French.\n'
      '- Light & Dark Mode.\n'
      '- Key Differentiators:\n'
      '- In addition to standard Islamic utilities, QuranLife includes advanced interactive features that are uncommon in similar applications:\n'
      '- User Authentication: Secure sign-up and login system.\n'
      '- Real-time Chat: Users can communicate with each other inside the application using live messaging.\n'
      '- AI-powered Islamic History Assistant:\n'
      '- Integration with an AI API dedicated to answering questions related to Islamic history.\n'
      '- Designed to act as a focused historical assistant rather than a general chatbot.\n'
      '- These features transform the application from a static tool into a community-oriented platform.';
  static const String projectQuranLifeTechStack =
      'Flutter for cross-platform development.\n'
      'State Management: GetX.\n'
      'Backend: Firebase for database management, authentication, and Real-time chat using Cloud Firestore.\n'
      'APIs: Prayer Times API, Google Maps API with customized filtering logic, AI API for Islamic History.\n'
      'Local Storage: SharedPreferences, SQLite, Offline-first Architecture for core functionalities.';
  static const String projectQuranLifeChallenges =
      'One of the most complex aspects of the project was prayer time handling and time-based logic, which required:\n'
      'Processing daily prayer data received from an external API.\n'
      'Determining the current and upcoming prayers accurately.\n'
      'Calculating remaining time dynamically.\n'
      'Triggering UI updates based on time changes.\n'
      'Ensuring correct behavior across different locations and time zones.\n'
      'To manage complexity, the application architecture was divided into independent controllers, each responsible for a specific feature. This approach improved code clarity, scalability, and long-term maintainability.';
  static const String projectQuranLifeRole =
      'Project concept and feature definition.\n\n'
      'UI/UX planning and design decisions.\n\n'
      'Full application development from scratch.\n\n'
      'Architectural and technical decision-making.\n\n'
      'Performance optimization and functional testing.\n\n'
      'The application was developed independently.\n\n';
  static const String projectQuranLifeProjectStatus =
      'The application is complete, stable, and fully functional.'
      'A direct APK download link is provided in the below in "Download & Link" section.';
  // Contact Section
  static const String contactTitle = 'Contact';
  static const String interestedInWorking = 'Interested in working together?';
  static const String emailMe = 'Email Me';
  static const String gitHub = 'GitHub';
}
