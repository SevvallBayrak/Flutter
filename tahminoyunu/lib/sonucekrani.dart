import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sonucekrani extends StatefulWidget {
  bool sonuc;
  sonucekrani({required this.sonuc});
  @override
  State<sonucekrani> createState() => _sonucekraniState();
}

class _sonucekraniState extends State<sonucekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("oyun sayfasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            SizedBox
              (
                width: 360,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: widget.sonuc ? Image.asset("resimler/gulenyuz.png") : Image.asset("resimler/uzgun.png") ,
                )
              ),
            widget.sonuc ? Text("Tebrikler Kazandınız",style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold,color: Colors.orangeAccent),) : Text("kaybettiniz!!",style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.red),),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    foregroundColor: Colors.white70,
                    backgroundColor: widget.sonuc ? Colors.orangeAccent : Colors.red,
                  ),


                  child: Text("Tekrar başla",style: TextStyle(
                    fontSize: 40,
                  ),)),
            ),

          ]
        ),
      ),
    );
  }
}
