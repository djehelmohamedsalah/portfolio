class AppStrings {
  AppStrings._();

  static const String appTitle = 'Portfolio';
  static const String portfolioTitle = 'My Portfolio';

  // Navigation
  static const String navHome = 'Home';
  static const String navProjects = 'Projects';
  static const String navAbout = 'About';
  static const String navSkills = 'Skills';
  static const String navContact = 'Contact';

  // Home Section
  static const String homeSectionTitle = 'Home';
  static const String homeTitleFirstPart = 'I am';
  static const String homeTitleSecondPart = 'Mohamed';
  static const String homeTitleThirdPart = 'Salah Djehel';
  static const String role = 'Mobile Application Developer';
  static const String viewMyWork = 'View My Work';
  static const String hireMe = 'Hire Me';

  // Skills Section
  static const String skillsTitle = 'Skills';
  static const String techStack = 'Tech Stack';
  static const String skillFlutter = 'Flutter';
  static const String skillDart = 'Dart';
  static const String skillFirebase = 'Firebase';
  static const String skillRestApi = 'Rest API';
  static const String skillUiUx = 'UI/UX Design';
  static const String skillGit = 'Git & GitHub';
  static const String skillStateManagement = 'State Management';

  // About Section
  static const String aboutTitle = 'About Me';
  static const String aboutDescription =
      "I am a highly disciplined and committed individual who has been developing my skills in software development consistently for over two years. I work on a structured daily routine, balancing learning, programming, personal development, and problem-solving.\n\n"
      "My motivation comes from a genuine passion for software development and building projects from scratch. Even without formal degrees in computer science, I continuously push myself to improve by working on real projects, learning new technologies, and solving complex problems.\n\n"
      "I thrive under challenges and pressures. Financial limitations, personal difficulties, or technical obstacles never stop me; instead, they strengthen my determination. I approach every problem step by step, planning carefully before coding, and always seeking efficient and clean solutions.\n\n"
      "Consistency is my main strength. I have maintained a disciplined learning schedule, structured workflows, and long-term projects, proving that I am serious and reliable.\n\n"
      "I see the Ausbildung system as the ideal environment to combine discipline, structured learning, and real responsibility.\n\n"
      "I am confident that my persistence, self-discipline, and practical experience make me well-suited for an Ausbildung. I am ready to learn, follow structured training, and contribute effectively in a professional environment.\n\n";
  // Projects Section
  static const String projectsTitle = 'Projects';

  // Newsily app
  static const String projectNewsilyTitle = 'Newsily App';
  static const String projectNewsilyOverview =
      'Newsily is a mobile application that aggregates news from multiple international newspapers and media sources through a news API, allowing users to stay informed without the need to visit several websites individually. The app is designed to provide a quick daily overview of important news while saving time and reducing information overload.\n\n'
      'Newsily is intended for users who regularly follow news but want a centralized, organized, and efficient way to access articles from different sources in one place.';
  static const String projectNewsilyCoreFeatures =
      'News aggregation from multiple global sources via API\n'
      'Category-based browsing for focused reading\n'
      'Daily automatic updates\n'
      'Article search functionality\n'
      'Save articles for later reading\n'
      'Offline access through local caching\n'
      'Light and dark mode for comfortable reading\n';
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
      'Performance optimization and functional testing.';
  static const String projectNewsilyProjectStatus =
      'The application is complete, stable, and fully functional.\n'
      //TODO: Add a direct APK download link
      'A direct APK download link is provided in the portfolio.';

  // Raqib app
  static const String projectRaqibTitle = 'Raqib App';
  static const String projectRaqibOverview =
      'Raqib is a mobile application designed to empower users to report trade violations directly to the Ministry of Trade.\n'
      'The application streamlines the reporting process, allowing users to submit detailed reports, track the progress of each report, and stay informed about official updates.\n'
      'The main goal is to provide a transparent, efficient, and user-friendly reporting system, making it easier for citizens to participate in regulatory compliance.\n';
  static const String projectRaqibCoreFeatures =
      'User Authentication: Secure sign-in options including email/password, Google, and anonymous access.\n'
      'Report Submission:\n'
      'Users can report violations by selecting the type of violation.\n'
      'Reports are stored in Supabase and synchronized in real-time.\n'
      'Report Tracking:\n'
      'Users can follow the progress of each report across multiple stages.\n'
      'Admins can update the stage of a report, which is immediately reflected to the user.\n'
      'Offline Support: Users can fill reports offline and submit when connection is available.\n'
      'Multi-language Support: Arabic, English, French.\n'
      'Light/Dark Mode for better usability.\n';
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
      'Oversaw testing, bug fixing, and performance optimization.\n'
      'The project was developed entirely independently, with all architectural, design, and technical decisions made by me.';
  static const String projectRaqibProjectStatus =
      'Fully functional and stable.\n'
      //TODO: add doinload link
      'APK download link included in the portfolio for direct access.';

  // QuranLife app
  static const String projectQuranLifeTitle = '';
  static const String projectQuranLifeOverview = '';
  static const String projectQuranLifeCoreFeatures = '';
  static const String projectQuranLifeTechStack = '';
  static const String projectQuranLifeChallenges = '';
  static const String projectQuranLifeRole = '';
  static const String projectQuranLifeProjectStatus = '';

  // portfolio site
  static const String projectPortfolioSiteTitle = '';
  static const String projectPortfolioSiteOverview = '';
  static const String projectPortfolioSiteCoreFeatures = '';
  static const String projectPortfolioSiteTechStack = '';
  static const String projectPortfolioSiteChallenges = '';
  static const String projectPortfolioSiteRole = '';
  static const String projectPortfolioSiteProjectStatus = '';

  // Contact Section
  static const String contactTitle = 'Contact';
  static const String interestedInWorking = 'Interested in working together?';
  static const String emailMe = 'Email Me';
  static const String gitHub = 'GitHub';
}
