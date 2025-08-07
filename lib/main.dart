import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_multi/l10n/generated/app_localizations.dart';
import 'package:flutter_multi/widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en'); // Default locale

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multilingual App',
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('es'),
        Locale('ar'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: LandingPage(
        onLanguageChanged: _changeLanguage,
        currentLocale: _locale,
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;

  const LandingPage({
    Key? key,
    required this.onLanguageChanged,
    required this.currentLocale,
  }) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _navigateToSection(String section) {
    double offset = 0;
    switch (section) {
      case 'home':
        offset = 0;
        break;
      case 'team':
        offset = 600;
        break;
      case 'pricing':
        offset = 1200;
        break;
      case 'contacts':
        offset = 2000;
        break;
    }

    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final l10n = AppLocalizations.of(context);

      // Simulate form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.contactSuccess),
          backgroundColor: Colors.green,
        ),
      );

      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isRTL = widget.currentLocale.languageCode == 'ar';

    return Directionality(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(
          onLanguageChanged: widget.onLanguageChanged,
          currentLocale: widget.currentLocale,
          onNavigate: _navigateToSection,
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // Home Section
              _buildHomeSection(l10n),

              // Team Section
              _buildTeamSection(l10n),

              // Pricing Section
              _buildPricingSection(l10n),

              // Contact Section
              _buildContactSection(l10n),

              // Footer
              _buildFooter(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeSection(AppLocalizations l10n) {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.homeTitle,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Text(
                l10n.homeSubtitle,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => _navigateToSection('contacts'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.homeCta,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamSection(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          Text(
            l10n.teamTitle,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTeamMember('John Doe', l10n.teamCeo),
              _buildTeamMember('Jane Smith', l10n.teamCto),
              _buildTeamMember('Mike Johnson', l10n.teamLead),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Icon(Icons.person, size: 60, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Text(role, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
      ],
    );
  }

  Widget _buildPricingSection(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(64),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            l10n.pricingTitle,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPricingCard(l10n.pricingBasic, '\$29', l10n.pricingMonth, l10n.pricingChoose),
              _buildPricingCard(l10n.pricingPro, '\$59', l10n.pricingMonth, l10n.pricingChoose, isPopular: true),
              _buildPricingCard(l10n.pricingEnterprise, '\$99', l10n.pricingMonth, l10n.pricingChoose),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(String title, String price, String period, String buttonText, {bool isPopular = false}) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isPopular ? Colors.blue : Colors.grey.shade300,
          width: isPopular ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: price,
                  style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
                ),
                TextSpan(
                  text: period,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: isPopular ? Colors.blue : Colors.grey.shade200,
              foregroundColor: isPopular ? Colors.white : Colors.black87,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(64),
      child: Column(
        children: [
          Text(
            l10n.contactTitle,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: 500,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: l10n.contactEmail,
                      hintText: l10n.contactEmailHint,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: l10n.contactMessage,
                      hintText: l10n.contactMessageHint,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a message';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(l10n.contactSend, style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey.shade900,
      child: Center(
        child: Text(
          '© 2024 ${l10n.appTitle}. All rights reserved.',
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
