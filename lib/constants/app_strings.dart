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
      'Performance optimization and functional testing.\n'
      'AI tools were used selectively to accelerate development in specific areas, while all architectural, design, and implementation decisions were made by me.';

  static const String projectNewsilyProjectStatus =
      'The application is complete, stable, and fully functional.\n'
      'A direct APK download link is provided below in "Download & Link" section.';

  // Raqib app
  static const String projectRaqibTitle = 'Raqib App';
  static const String projectRaqibOverview =
      'Raqib is a mobile application designed to empower users to report trade violations directly to the Ministry of Trade.\n'
      'The application streamlines the reporting process, allowing users to submit detailed reports, track the progress of each report, and stay informed about official updates.\n'
      'The main goal is to provide a transparent, efficient, and user-friendly reporting system, making it easier for citizens to participate in regulatory compliance.\n';
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
      'Oversaw testing, bug fixing, and performance optimization.\n'
      'AI tools were used selectively to accelerate development in specific areas, while all architectural, design, and implementation decisions were made by me.';
  static const String projectRaqibProjectStatus =
      'Fully functional and stable.\n'
      'APK download link included below in "Download & Link" section.';

  // QuranLife app
  static const String projectQuranLifeTitle = 'QuranLife App';
  static const String projectQuranLifeOverview =
      'QuranLife is a comprehensive mobile application designed to support Muslims in practicing their religious duties easily and consistently, anywhere and at any time.\n'
      'The application combines multiple essential Islamic features into a single, well-structured platform, eliminating the need to rely on several separate apps.\n'
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
      'The application was developed independently.\n\n'
      'AI tools were used selectively to accelerate development in specific areas, while all architectural, design, and implementation decisions were made by me.';
  static const String projectQuranLifeProjectStatus =
      'The application is complete, stable, and fully functional.'
      'A direct APK download link is provided in the below in "Download & Link" section.';
  // Contact Section
  static const String contactTitle = 'Contact';
  static const String interestedInWorking = 'Interested in working together?';
  static const String emailMe = 'Email Me';
  static const String gitHub = 'GitHub';
}
