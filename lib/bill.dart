
import 'package:flutter/material.dart';
import 'package:splitbill/main.dart';

class bill extends StatefulWidget {
  final double _currentslidervalue;
  final double Tip;
  final String Tax;
  final String sb;
   bill(this._currentslidervalue,this.Tip,this.Tax,this.sb);

  @override
  State<bill> createState() => _billState();
}

class _billState extends State<bill> {
  void initState() {
    // TODO: implement initState
    super.initState();
    calculation();
  }
  double result=0;
  void calculation(){
    double Taxamount=double.parse(widget.sb)*(double.parse(widget.Tax)/100);
    double finalbill=(double.parse(widget.sb)+Taxamount+widget.Tip)/widget._currentslidervalue;
    setState(() {
      result=finalbill;
      print(result);
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        children: [SizedBox(height: 60,),Align(alignment: Alignment.centerRight,),
          Text("Result",style: TextStyle(fontSize: 30,
          color: Colors.white),),
          Container(
            height: 200,
            width: screenWidth,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(color:
            Colors.white,
                borderRadius: BorderRadius.circular(35)),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("Equally Divided",style: TextStyle(
                            fontSize: 22,color: Colors.indigo
                          ),),
                          Text(result.toString(),style: TextStyle(
                              fontSize: 22,color: Colors.indigo
                          ),),
                        ],
                      ),
                    ),

                      SizedBox(width: 20,),
                      Column(
                        children: [SizedBox(height: 18,),
                          Text("FRIENDS:",style: TextStyle(fontSize: 20,
                          color: Colors.indigo),),
                          Text("TIP:",style: TextStyle(fontSize: 20,
                          color: Colors.indigo),),
                          Text("TAX:",style: TextStyle(fontSize: 20,
                          color: Colors.indigo),)
                        ],
                      ),
                    Column(
                      children: [SizedBox(height: 18,),
                        SizedBox(width: 10,),
                        Text(
                          widget._currentslidervalue.round().toString(),
                          style: TextStyle(
                              fontSize: 20, color: Colors.indigo),
                        ),
                        Text(
                        widget.  Tip.round().toString(),
                          style: TextStyle(
                              fontSize: 20, color: Colors.indigo),
                        ),
                        Text(
                        widget.  Tax,
                          style: TextStyle(
                              fontSize: 20, color: Colors.indigo),
                        ),

                      ],
                    )


                  ],
                ),SizedBox(height: 30,),
                Text("Evarybody Should Pay",style: TextStyle(
                  fontSize: 30,color: Colors.orangeAccent
                ),),
                Text(result.toString(),style: TextStyle(fontSize:
                25,color: Colors.red),)
              ],
            ),


          ),
          SizedBox(
            width: screenWidth,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new split()));

                },
                child: const Text(
                  'Calculate again ?',
                  style: TextStyle(fontSize: 25, color: Colors.indigo),
                ),
              ),
            ),
          ),
        ],

      ),

    );
  }
}
