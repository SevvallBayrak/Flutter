import 'package:flutter/material.dart';
import 'package:tahminoyunu/oyunekrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranbilgisi.size.height;
    final double ekranGenisligi = ekranbilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("TAHMİN OYUNU",style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              ),
            ),
            SizedBox(
                height: ekranYuksekligi/4,
                width: ekranGenisligi/2,
                child: Image.asset("resimler/tahmin.jpeg")
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shadowColor: Colors.black,
                  elevation: 30,

                ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>oyunekrani()));
                    print("sayfa geçişi yapıldı");
                  },
                  child: Text("Oyuna Başla",style: TextStyle(
                    color: Colors.white,
                    height: ekranYuksekligi/170,
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
