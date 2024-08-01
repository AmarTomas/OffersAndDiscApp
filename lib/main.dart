// ignore_for_file: non_constant_identifier_names, avoid_print, library_private_types_in_public_api
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:offersanddisapp/Abouts.dart';
import 'package:offersanddisapp/Pages/DisplayProducts.dart';
import 'package:offersanddisapp/Pages/PageStores.dart';
import 'package:offersanddisapp/firebase.dart';
Future<void> shareApp() async {
  // Set the app link and the message to be shared
  const String appLink =
      '00000000000000' '\n\n او من Whatsapp \n\n 00000qZGoZzPZ0U';
  const String des =
      ' عروض وتخفيضات اليمن لمتابعة عروض اكبر المتاجر والاسواق يوميا حمل التطبيق الان ';
  String message =  "$desمن Telegram ";

  // Share the app link and message using the share dialog
  await FlutterShare.share(
      title: 'مشاركة التطبيق', text: message, linkUrl: appLink);
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme:ThemeData(
          primaryColor: Colors.blueGrey[300],
           appBarTheme: AppBarTheme(color: Colors.blueGrey[300])
        ),

        debugShowCheckedModeBanner: false,

        home: const Home());
  }
}

class Home extends StatefulWidget {
  final int index;
  const Home({Key? key,this.index=0}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  late int _selectedIndex ;
  @override
  void dispose() {
    // TODO: implement dispose
    context.dependOnInheritedWidgetOfExactType;
    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
  _selectedIndex=widget.index;
    super.initState();
  }

  final List<Widget> _tabs = [
    const DisplayProducts(),
    const PageStores(),
    const AboutPage(),

  ];

  @override
  Widget build(BuildContext context) {
    double appBarWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: buildAppBar(appBarWidth, context),

      drawer: buildDrawer(context),

      body: Column(
        children: [

          _selectedIndex < _tabs.length ? _tabs[_selectedIndex] : Container(),
        ],
      ), // Empty container for the new screen
            bottomNavigationBar:BottomNavigationBar(
showUnselectedLabels: true,
fixedColor: Colors.blue,
unselectedItemColor: const Color(0xFF9ebbe9),
elevation: 4,
currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              if(value==3){
                shareApp();
              }else {
                _selectedIndex = value;
              }});
          },
          items: const[
         BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'الرئيسية'),
             BottomNavigationBarItem(icon: Icon(Icons.store_outlined),label: 'الأسواق'),
             BottomNavigationBarItem(icon: Icon(Icons.info_outline),label: 'عن التطبيق'),
             BottomNavigationBarItem(icon: Icon(Icons.share_outlined),label: 'مشاركة',),
      ]),
    );
  }

  buildAppBar(double appBarWidth, BuildContext context) {}

  buildDrawer(BuildContext context) {}


}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseApi().FunctionGetToken();
   requestNotificationPermissions();
  // تحقق من حالة الاتصال بالإنترنت
  var connectivityResult = await (Connectivity().checkConnectivity());
  Widget initialWidget;

  if (connectivityResult == ConnectivityResult.none) {
    initialWidget = const NoConnectivity();
  } else {
    initialWidget = const MyApp();
  }
  runApp( initialWidget);
}
class NoConnectivity extends StatelessWidget {
  const NoConnectivity({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: Center(
          child: Column( children: [

            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),

                child: const CircleAvatar(
               radius: 180,
                  backgroundImage:  AssetImage('images/icons.png'),) ),
         Container(
           alignment: Alignment.center,
             child:   const Padding(padding: EdgeInsets.all(50),child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.error,color: Colors.white),
           SizedBox(width: 10,),
           Text('تحقق من الاتصال ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
           ),


         ],)  )),],)
        ),
      ),
    );
  }
}
