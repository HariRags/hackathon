import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:slider_button/slider_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Events',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ElevatedButton(
            onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: Text(
                        'Choose your Entry gate',
                        style: TextStyle(fontSize: 25),
                      ),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QRcode()),
                                ),
                            child: Text('Gate 1')),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QRcode()),
                                ),
                            child: Text('Gate 2')),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QRcode()),
                                ),
                            child: Text('Gate 3')),
                        TextButton(
                            onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const QRcode()),
                                ),
                            child: Text('Gate 4')),
                      ],
                    )),
            child: Row(
              children: [
                Container(
                  height: 110,
                  child: Expanded(
                    child: Container(
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              'Techfest',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 60),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class QRcode extends StatelessWidget {
  const QRcode({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ticket',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 170),
          QrImage(
            data: 'The encrypted string',
            size: 300,
          ),
          SizedBox(height: 30),
          Text('Scan this QR code at Scanner A at Gate 1 and at Techfest Gate'
               ,style: TextStyle( fontSize: 25) , textAlign: TextAlign.center,),
          SizedBox(height: 40,),
          SliderButton(
            action: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            label: Text(
              "Slide to discard ticket",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            icon: Text(
              "x",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 44,
              ),
            ),
            width: 300,
            buttonColor: Colors.red,
            radius: 10,
          )
        ],
      )),
    );
  }
}
