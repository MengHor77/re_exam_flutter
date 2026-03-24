import 'login.dart';
import 'profile_item.dart';
import 'cart_provider.dart';
import 'local_storage.dart';
import 'state_managment.dart';
import 'login_with_res_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card_counter_using_provider.dart';
import 'crud_operation_using_rest_api.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}
/*
answer 1

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(' my appbar'),
          backgroundColor: Colors.green,
        ),
        body: Align(alignment: Alignment.center, child: Text('my tex ')),
      ),
    );
  }
}
*/

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(' Student Profile')),
        body: Builder(
          builder: (context) {
            return Align(
              alignment: Alignment.center,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/profile.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ProfileItem(title: 'Mastering Java', value: '\$25.00'),
                        ProfileItem(
                          title: 'Java Programming',
                          value: '\$12.90',
                        ),
                        ProfileItem(
                          title: 'Flutter Development',
                          value: '\$30.00',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text('login '),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StateManagement(),
                              ),
                            );
                          },
                          child: Text('go to increase '),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartCounterUsingProvider(),
                              ),
                            );
                          },
                          child: Text('go to Card provider '),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginWithRestApi(),
                              ),
                            );
                          },
                          child: Text('go to  LoginWithRestApi '),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CrudOperationUsingRestApi(),
                              ),
                            );
                          },
                          child: Text('go to  crud_operation_using_rest_api '),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginLocalStoragePage(),
                              ),
                            );
                          },
                          child: Text('go to  LoginLocalStoragePage '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
//