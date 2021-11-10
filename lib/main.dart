import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:trabalho_final_dadm/components/fab/fancy_fab.dart';
import 'package:trabalho_final_dadm/components/views/about_view.dart';
import 'package:trabalho_final_dadm/components/views/check_plastic_view.dart';
import 'package:trabalho_final_dadm/components/views/collect_view.dart';
import 'package:trabalho_final_dadm/components/views/games_view.dart';
import 'package:trabalho_final_dadm/components/views/home_view.dart';
import 'package:trabalho_final_dadm/themes/app_colors.dart';
import 'package:trabalho_final_dadm/themes/app_theme.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:share/share.dart';

var boolKey = 'isFirstTime';
var prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Desplastifique-se';

  Widget _introScreen() {
    var isFirstTime = prefs.getBool(boolKey) ?? true;
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 3,
          backgroundColor: AppColors.primary,
          navigateAfterSeconds: isFirstTime ? OnBoardingPage() : Main(isFirstTime: false),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/logo.png"),
              fit: BoxFit.scaleDown,
              scale: 2
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: _introScreen(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    prefs.setBool(boolKey, false);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Main(isFirstTime: true)),
    );
  }

  Widget _buildImage(String assetName, [double size = 180]) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: Image.asset('assets/intro/$assetName', height: size, width: size)
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      color: AppColors.primary,
      skipColor: AppColors.primary,
      doneColor: AppColors.primary,
      nextColor: AppColors.primary,
      key: introKey,
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Descubra",
          body:
          "Descubra qual o tipo de cada plástico para descartá-lo adequadamente.",
          image: _buildImage('trash.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Aprenda",
          body:
          "Utilize este aplicativo para aprender mais sobre os polímeros.",
          image: _buildImage('plastic2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Colabore",
          body:
          "Tire fotos de plásticos e envie para nós (nós vamos analisá-las e propor soluções inovadoras).",
          image: _buildImage('plastic3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Se divirta",
          body:
          "A Capi está aqui para te ensinar. E temos até alguns joguinhos para você se divertir.",
          image: _buildImage('games.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Por um mundo mais consciente",
          body:
          "Este aplicativo é o primeiro passo para conscientizar você e outras pessoas sobre o "
              "uso de plástico na região.",
          image: _buildImage('earth.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: AppColors.primary,
        color: Color(0xFFBDBDBD),
      ),
    );
  }
}

class Main extends StatefulWidget {
  final bool isFirstTime;
  const Main({this.isFirstTime, Key key}) : super(key: key);

  @override
  _Main createState() => _Main(isFirstTime: this.isFirstTime);
}

class _Main extends State<Main> {
  final bool isFirstTime;
  _Main({this.isFirstTime});

  int _selectedIndex = 0;
  static List<Widget> _widgetOptionsFirstTime = <Widget>[
    HomeView(firstTime: true),
    CheckPlasticView(),
    CollectView(),
    GamesView(),
    AboutView(),
  ];
  static List<Widget> _widgetOptions = <Widget>[
    HomeView(firstTime: false),
    CheckPlasticView(),
    CollectView(),
    GamesView(),
    AboutView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desplastifique-se',
      theme: AppThemeDataFactory.prepareThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Verificar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Coleta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              label: 'Jogos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Sobre',
            ),
          ],
          selectedItemColor: AppColors.secondary,
          backgroundColor: AppColors.primary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        appBar: AppBar(
          elevation: 0,
          title: Row(
            children: [
              Image.asset(
                'assets/icons/logo.png',
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              const Text('Desplastifique-se'),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              tooltip: 'Compartilhar',
              onPressed: () {
                Share.share('Desplastifique-se é um aplicativo para '
                    'conscientizar as pessoas sobre o uso de plástico. '
                    'Saiba mais: https://desplastifique.wordpress.com/',
                    subject: 'Disponível na Google Play.');
              },
            ),
          ],
        ),
        body: isFirstTime ? _widgetOptionsFirstTime[_selectedIndex] : _widgetOptions[_selectedIndex],
        floatingActionButton: FancyFab(),
      ),
    );
  }
}
