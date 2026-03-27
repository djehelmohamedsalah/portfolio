import 'resume_downloader_stub.dart'
    if (dart.library.html) 'resume_downloader_web.dart' as downloader;

Future<bool> downloadResume(String url) {
  return downloader.downloadResume(url);
}
