import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:finances_app/core/home/screens/home_screen.dart';
import 'package:finances_app/core/settings/settings_service.dart';
import 'package:finances_app/core/settings/settings_provider.dart';

import 'route_generator.dart';
import 'lib_color_schemes.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsProvider = SettingsProvider(SettingsService());
  await settingsProvider.loadSettings();

  runApp(Finances(settingsProvider: settingsProvider));
}

class Finances extends StatelessWidget {
  final SettingsProvider settingsProvider;

  const Finances({required this.settingsProvider, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => settingsProvider),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finanças',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          fontFamily: GoogleFonts.nunito().fontFamily,
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor:
                lightColorScheme.secondaryContainer.withOpacity(0.25),
            indicatorColor: lightColorScheme.primaryContainer,
            labelTextStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          fontFamily: GoogleFonts.nunito().fontFamily,
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: darkColorScheme.secondaryContainer.withOpacity(0.25),
            indicatorColor: darkColorScheme.primaryContainer,
            labelTextStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("pt", "BR"),
        ],
        onGenerateRoute: RouteGenerator.generateRoute,
        themeMode: context.watch<SettingsProvider>().themeMode,
        home: const MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: "Início"),
          NavigationDestination(
              icon: Icon(Icons.account_circle), label: "Perfil"),
        ],
      ),
    );
  }
}
