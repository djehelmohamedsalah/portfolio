import 'package:web/web.dart' as web;

Future<bool> downloadResume(String url) async {
  final sanitizedName = _extractFileName(url);
  final anchor = web.HTMLAnchorElement()
    ..href = url
    ..download = sanitizedName
    ..target = '_blank';
  anchor.click();
  anchor.remove();
  return true;
}

String _extractFileName(String url) {
  final uri = Uri.parse(url);
  final last = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : '';
  if (last.isEmpty || last.endsWith('/')) return 'resume.pdf';
  return last;
}
