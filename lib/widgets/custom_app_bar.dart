import 'package:flutter/material.dart';
import 'package:flutter_multi/l10n/generated/app_localizations.dart';
import 'package:flutter_multi/widgets/language_switcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;
  final Function(String) onNavigate;

  const CustomAppBar({
    Key? key,
    required this.onLanguageChanged,
    required this.currentLocale,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      title: Row(
        children: [
          // Logo placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.flutter_dash,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            l10n.appTitle,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      actions: [
        // Desktop navigation items
        if (MediaQuery.of(context).size.width > 800) ...[
          _buildNavItem(context, l10n.navigationHome, 'home'),
          _buildNavItem(context, l10n.navigationTeam, 'team'),
          _buildNavItem(context, l10n.navigationPricing, 'pricing'),
          _buildNavItem(context, l10n.navigationContacts, 'contacts'),
          const SizedBox(width: 16),
        ],

        // Language switcher
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: LanguageSwitcher(
            onLanguageChanged: onLanguageChanged,
            currentLocale: currentLocale,
          ),
        ),

        // Mobile menu
        if (MediaQuery.of(context).size.width <= 800)
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.black87),
            itemBuilder: (context) => [
              PopupMenuItem(value: 'home', child: Text(l10n.navigationHome)),
              PopupMenuItem(value: 'team', child: Text(l10n.navigationTeam)),
              PopupMenuItem(value: 'pricing', child: Text(l10n.navigationPricing)),
              PopupMenuItem(value: 'contacts', child: Text(l10n.navigationContacts)),
            ],
            onSelected: onNavigate,
          ),
      ],
    );
  }

  Widget _buildNavItem(BuildContext context, String title, String section) {
    return TextButton(
      onPressed: () => onNavigate(section),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
