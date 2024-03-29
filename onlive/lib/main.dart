import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlive/Features/Auth/login-screen.dart';
import 'package:onlive/Features/Questions/Presentation/screens/questions_response.dart';
import 'package:onlive/Features/Questions/Presentation/screens/questions_screen.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding1.dart';
import 'package:onlive/Features/Registration/presentation/screens/onboarding_college_selection.dart';
import 'package:onlive/Features/Settings/Presentation/screens/settings_screen.dart';
import 'package:onlive/core/push_notifications/fcm.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Features/Auth/presentation/cubit/auth_cubit.dart';
import 'Features/Chat/presentation/cubit/chat_overview_cubit.dart';
import 'Features/Chat/presentation/cubit/redis_cubit.dart';
import 'Features/Chat/presentation/screens/chat_overview_screen.dart';
import 'Features/Registration/presentation/bloc/reguser_bloc.dart';
import 'Utils/Router/app_router.dart';
import 'Utils/app_bloc_observer.dart';
import 'injection_container.dart' as di;

Future<void> onBackgroundMessageHandler(RemoteMessage message) async {
  print(message.data);
  print(message.notification?.body);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken();
  await di.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessageHandler);
  // di.sl<Fcm>();

  FirebaseMessaging.onMessage.listen((event) {
    print('On message triggered');
    print(event.notification?.title);
    print(event.notification?.body);
  });
  // Fcm(FirebaseMessaging.instance);

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ReguserBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<RedisCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ChatOverviewCubit>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: di.sl<AppRouter>().onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Authenticated) return HomePageFoo();
            // if (authState is UnRegistered) return OnBoarding_First();
            return OnBoarding_First();
          },
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AutoTabsScaffold();
//   }
// }

class HomePageFoo extends StatefulWidget {
  const HomePageFoo({Key? key}) : super(key: key);

  @override
  State<HomePageFoo> createState() => _HomePageFooState();
}

class _HomePageFooState extends State<HomePageFoo> {
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
    QuestionsResponseScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RedisCubit, RedisState>(
      listener: (context, state) {
        if (state is RedisNewEvents) {
          // stat
          print('New Event received');
        }
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _selectedIndex,
          onTap: (ind) => _onItemTapped(ind),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.question_answer),
              title: Text('Chat'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.group),
              // icon: FaIcon(FontAwesomeIcons.solidComments),
              // icon: ,
              title: Text('Groups'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.quiz),
              title: Text('Questions'),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.chat),
        //       label: 'Chats',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Groups',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'Questions',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.amber[800],
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }
}
