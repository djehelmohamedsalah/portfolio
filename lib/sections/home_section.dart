import 'package:flutter/material.dart';
import '../widgets/section_container.dart';

class HomeSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onViewWork;

  const HomeSection({
    super.key,
    required this.sectionKey,
    required this.onViewWork,
  });

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      key: sectionKey,
      title: "Home",
      color: Colors.transparent,
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "together\n name",
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.1,
              letterSpacing: -2,
            ),
          ),
          Text(
            "Flutter Developer & Designer",
            style: TextStyle(
              fontSize: 32,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: onViewWork,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text("View My Work"),
          ),
        ],
      ),
    );
  }
}
