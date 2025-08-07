import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LanguageSwitcher extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;

  const LanguageSwitcher({
    Key? key,
    required this.onLanguageChanged,
    required this.currentLocale,
  }) : super(key: key);

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  static const Map<String, Map<String, String>> languages = {
    'en': {'name': 'English', 'flag': '🇺🇸'},
    'fr': {'name': 'Français', 'flag': '🇫🇷'},
    'es': {'name': 'Español', 'flag': '🇪🇸'},
    'ar': {'name': 'العربية', 'flag': '🇸🇦'},
  };

  @override
  Widget build(BuildContext context) {
    final currentLang = languages[widget.currentLocale.languageCode] ?? languages['en']!;

    return PopupMenuButton<String>(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentLang['flag']!,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 8),
            Text(
              currentLang['name']!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down, size: 18),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        return languages.entries.map((entry) {
          return PopupMenuItem<String>(
            value: entry.key,
            child: Row(
              children: [
                Text(
                  entry.value['flag']!,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 12),
                Text(entry.value['name']!),
                if (entry.key == widget.currentLocale.languageCode) ...[
                  const Spacer(),
                  const Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 16,
                  ),
                ],
              ],
            ),
          );
        }).toList();
      },
      onSelected: (String languageCode) {
        widget.onLanguageChanged(Locale(languageCode));
      },
    );
  }
}
