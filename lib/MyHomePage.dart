import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var itController = TextEditingController();

  var result = "";
  var bgColor = Color.fromARGB(255, 32, 155, 184);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              // Call the function to show the pop-up
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Know More About BMI!!'),
                    content: Text(
                        'BMI is a measurement that takes into account your height, and weight to produce a calculation. This calculation is a measurement of your body size and can be used to determine how your body weight is related to your height. It is a method of determining whether you may be underweight, average weight, overweight, or obese, but it has flaws.'),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 302,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    "https://tse4.mm.bing.net/th?id=OIP.JfCZY_DjmDYzbXydSmo0mwHaHa&pid=Api&P=0&h=180",
                    height: 30,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Body Mass Index',
                    style: TextStyle(
                      fontSize: 34,
                      color: Color.fromARGB(255, 82, 18, 231),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 99,
              ),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text(
                    'Your Weight(in Kgs)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.accessibility,
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(
                height: 9,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
// Feet Input
                Container(
                  width: 149.0,
                  child: TextField(
                    controller: ftController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        'Your Height(in Feet)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.accessibility,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15.0), // Add some space between feet and inches

// Inches Input
                Container(
                  width: 99.0,
                  child: TextField(
                    controller: inController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text(
                        '(Inches)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              TextField(
                controller: itController,
                decoration: InputDecoration(
                  label: Text(
                    'Your Age',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.accessibility,
                    size: 21,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inchi = inController.text.toString();
                    var ag = itController.text.toString();

                    if (wt != "" && ft != "" && ag != "") {
                      //BMI
                      var iwt = int.parse(wt);
                      var heightf = int.parse(ft);
                      var heighti = int.parse(inchi);
                      var agi = int.parse(ag);

                      var fhigh = (heightf * 0.305) + (heighti * 0.0254);

                      var bmi = iwt / (fhigh * fhigh);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You're OverWeight!!";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 18) {
                        msg = "You're UnderWeight";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You're Fit And Healthy";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result =
                            "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = " **Please fill all the required field!!**";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white60,
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              Text(
                result,
                style: TextStyle(
                  fontSize: 19,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
