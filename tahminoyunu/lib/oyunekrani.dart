import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tahminoyunu/sonucekrani.dart';

class oyunekrani extends StatefulWidget {
  const oyunekrani({super.key});

  @override
  State<oyunekrani> createState() => _oyunekraniState();
}

class _oyunekraniState extends State<oyunekrani> {
  var  tfTahmin = TextEditingController();
  int rastgeleSayi = 0 ;
  int kalanHak =5;
  String yonlendirme = "";
  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
  }
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
          children:[
            Text("Kalan Hak : ${kalanHak} ",style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text("Yardım : ${yonlendirme}",style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: tfTahmin,
              decoration: InputDecoration(
                labelText: "Tahmin",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed:(){
                    setState(() {
                      kalanHak = kalanHak -1;
                    });
                    int tahmin = int.parse(tfTahmin.text);
                    if(tahmin == rastgeleSayi){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>sonucekrani(sonuc : true)));
                      return;
                    }
                    if(tahmin > rastgeleSayi){
                      setState(() {
                        yonlendirme = "tahmini azaltmalısın!!";
                      });}
                      if(tahmin < rastgeleSayi){
                        setState(() {
                          yonlendirme = "tahmini artırmalısın!!";
                        });
                      }
                      if(kalanHak == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>sonucekrani(sonuc: false,)));
                      }
                      tfTahmin.text= "";

                    },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                  ),

                    child: Text("Tahmin Et",style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
