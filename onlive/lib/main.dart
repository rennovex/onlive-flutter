import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Chat/presentation/screens/chat_overview_screen.dart';
import 'package:onlive/Features/Chat/presentation/screens/chat_screen.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding3.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding_college_selection.dart';
import 'package:onlive/Utils/Router/app_router.dart';
// <<<<<<< HEAD
// import 'package:onlive/Features/Registration/onboarding1.dart';
// =======
import 'package:onlive/Features/Registration/presentation/screens/onboarding1.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding3.dart';

import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'Features/Registration/presentation/screens/onboarding_avatar_selection_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: di.sl<AppRouter>().onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<AuthCubit>(),
          )
        ],
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ChatOverviewScreen(),
    Center(
      child: Text(
        'Groups',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Questions',
        style: optionStyle,
      ),
    ),
    Center(
      child: Text(
        'Settings',
        style: optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Questions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
