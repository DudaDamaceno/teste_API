import 'package:flutter/material.dart';
import 'package:tela1/data/dataController.dart';
import 'package:tela1/model/moneyModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      title: 'Nome da Página aí',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". 
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'cada click é um real a mais na sua conta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }
  moneyModel model = moneyModel();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          children:[
          FutureBuilder<moneyModel?>(
            future: DataController().getMoney(),
            builder:  (context, snapshot) {
            if(snapshot.connectionState== ConnectionState.waiting){
              return CircularProgressIndicator();
            }

            if (snapshot.error == true){
              return Text("Erro ao carregar!");

            }
            //moneyModel model = moneyModel();
            model = snapshot.data ?? model;
            return Text(model.bTCBRL?.name ?? "");
            },
            ),
            ],
        
   
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.mouse_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
