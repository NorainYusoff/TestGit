import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

enum gender { male, female }
enum calory { sedentary, light_active, mod_active, active, sup_active }

class _MyAppState extends State<MyApp> {
  final TextEditingController agecontroller = TextEditingController();
  final TextEditingController heightcontroller = TextEditingController();
  final TextEditingController weightcontroller = TextEditingController();
  double height = 0.0, weight = 0.0, age = 0.0, bmr = 0.000, calories = 0.000;
  //gender Genders;
  int malegdr = 1, femalegdr = 2;
  String sed, light, mod, act, spr;
  
  gender _gender = gender.male;
  calory _calory = calory.sedentary;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'Metric BMR Calculator',),
              Tab(text: 'Imperial BMR Calculator',),
            ],
          ),
          title: Text('BMR CALCULATOR'),
        ),
        body: Center(
            //slivers: <Widget>[
            //child: Stack(
            //body: Center(
            child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          children: <Widget>[
            RadioListTile<gender>(
              title: const Text('male'),
              value: gender.male,
              groupValue: _gender,
              onChanged: (gender malegdr) {
                setState(() {
                  _gender = malegdr;
                });
              },
            ),
            RadioListTile<gender>(
              title: const Text('female'),
              value: gender.female,
              groupValue: _gender,
              onChanged: (gender femalegdr) {
                setState(() {
                  _gender = femalegdr;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(hintText: "Age"),
                keyboardType: TextInputType.numberWithOptions(),
                controller: agecontroller,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(hintText: "Height In CM"),
                keyboardType: TextInputType.numberWithOptions(),
                controller: heightcontroller,
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                decoration: InputDecoration(hintText: "Weight In KG"),
                keyboardType: TextInputType.numberWithOptions(),
                controller: weightcontroller,
              ),
            ),

            RadioListTile<calory>(
              title: const Text('Sedentary'),
              value: calory.sedentary,
              groupValue: _calory,
              onChanged: (calory sed) {
                setState(() {
                  _calory = sed;
                });
              },
            ),
            RadioListTile<calory>(
              title: const Text('Lightly active'),
              value: calory.light_active,
              groupValue: _calory,
              onChanged: (calory light) {
                setState(() {
                  _calory = light;
                });
              },
            ),
            RadioListTile<calory>(
              title: const Text('Moderately Active'),
              value: calory.mod_active,
              groupValue: _calory,
              onChanged: (calory mod) {
                setState(() {
                  _calory = mod;
                });
              },
            ),
            RadioListTile<calory>(
              title: const Text('Active'),
              value: calory.active,
              groupValue: _calory,
              onChanged: (calory act) {
                setState(() {
                  _calory = act;
                });
              },
            ),
            RadioListTile<calory>(
              title: const Text('Super Active'),
              value: calory.sup_active,
              groupValue: _calory,
              onChanged: (calory spr) {
                setState(() {
                  _calory = spr;
                });
              },
            ),
            RaisedButton(
              child: Text("RESULT"),
              onPressed: _onPress,
            ),
            Text("Your BMR:  $bmr"),
            Text("Maintenace Calories per day: $calories"),
          ],
        )),
        )
      ),//ini scaffold 
    );
  }

  void _onPress() {
    setState(() {
      age = double.parse(agecontroller.text);
      height = double.parse(heightcontroller.text);
      weight = double.parse(weightcontroller.text);

      if (gender == malegdr) {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;

        if (calory == sed) {
          calories = (bmr*1.2);
        } else if (calory == light) {
          
          calories = (bmr*1.375);
        } else if (calory == mod) {
          
          calories = (bmr*1.55);
        } else if (calory == act) {
          
          calories = (bmr*1.725);
        } else {
          
          calories = (bmr*1.9);
        }

      } else  {
        bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;

        if (calory == sed) {
          calories = (bmr*1.2);
        } else if (calory == light) {
          calories = (bmr*1.375);
        } else if (calory == mod) {
          calories = (bmr*1.55);
        } else if (calory == act) {
          calories = (bmr*1.725);
        } else {
          calories = (bmr*1.9);
        }

      }

  
     
    });
  }
}
