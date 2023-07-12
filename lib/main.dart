import 'package:flutter/material.dart';
import 'package:splitbill/bill.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: split(),
  ));
}

class split extends StatefulWidget {
  const split({super.key});

  @override
  State<split> createState() => _splitState();
}

class _splitState extends State<split> {
  double _currentslidervalue = 0;
  String Tax = '';
  double Tip = 0;
  String sb = "";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "splitBill",
          style: TextStyle(fontSize: 30, color: Colors.orangeAccent),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 110,
              width: screenWidth,
              color: Colors.indigo,
              child: Row(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [SizedBox(width: 15,),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Total",
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                      ),
                      Text(
                       sb ,
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Column(
                    children: [SizedBox(height: 13,),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Friends :",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    "TIP :",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    "TAX",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    _currentslidervalue.round().toString(),
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    Tip.round().toString(),
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Text(
                                    Tax,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  height: 576,
                  width: screenWidth,
                  child: Column(
                    children: [
                      Text(
                        "How many friends ?",
                        style:
                            TextStyle(fontSize: 30, color: Colors.orangeAccent),
                      ),
                      Slider(
                          value: _currentslidervalue,
                          min: 0,
                          max: 40,
                          divisions: 40,
                          label: _currentslidervalue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentslidervalue = value;
                            });
                          }),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(20)),
                              height: 110,
                              width: 165,
                              child: Column(
                                children: [
                                  Text(
                                    "TIP",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FloatingActionButton(
                                          backgroundColor: Colors.indigo,
                                          onPressed: () {
                                            setState(
                                              () {
                                                Tip++;
                                              },
                                            );
                                          },
                                          child: const Icon(Icons.add),
                                        ),
                                      ),
                                      Text(
                                        Tip.round().toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      FloatingActionButton(
                                        backgroundColor: Colors.indigo,
                                        onPressed: () {
                                          setState(
                                            () {
                                              Tip--;
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.remove),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                           Container(
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            height: 110,
                            width: 155,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextField(
                                    onChanged: (value){
                                      setState(() {
                                        Tax=value;
                                      });
                                    },
                                    decoration: InputDecoration(hintText: ("TAX"),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.indigo))),

                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 260,
                          width: screenWidth,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    buildOutlinedButton("1"),
                                    buildOutlinedButton("2"),
                                    buildOutlinedButton("3"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    buildOutlinedButton("4"),
                                    buildOutlinedButton("5"),
                                    buildOutlinedButton("6"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    buildOutlinedButton("7"),
                                    buildOutlinedButton("8"),
                                    buildOutlinedButton("9"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    buildOutlinedButton("."),
                                    buildOutlinedButton("0"),
                                    buildOutlinedButton("_"),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.indigo,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          new bill(_currentslidervalue,Tip,Tax,sb

                                          )));
                            },
                            child: const Text(
                              'SplitBill',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  OutlinedButton buildOutlinedButton(
    String text,
  ) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if(text=='_'){
            sb = "";
          }
          else{
            sb+=text;
          }
        });
       },
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(backgroundColor: Colors.indigo),
    );
  }
}
