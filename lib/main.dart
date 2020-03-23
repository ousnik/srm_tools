import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
      routes: <String, WidgetBuilder>{
        "/LibraryPage": (BuildContext context) => new LibraryPage(),
        "/HomePage": (BuildContext context) => new HomePage(),
        "/AttendancePage": (BuildContext context) => new AttendancePage(),
        "/CGPAPage": (BuildContext context) => new CGPAPage()
      }));
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.black,
            child: new DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage('assets/srm.png'),
                    fit: BoxFit.fill,
                  )),
            ),
          ),
          new ListTile(
              title: new Text("Home"),
              trailing: new Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed("/HomePage");
              }),
          new Divider(),
          new ListTile(
              title: new Text("Attendance"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed("/AttendancePage");
              }),
          new Divider(),
          new ListTile(
              title: new Text("Library"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed("/LibraryPage");
              }),
          new Divider(),
          new ListTile(
              title: new Text("CGPA Calculator"),
              trailing: new Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed("/CGPAPage");
              }),
          new Divider(),
//          new ListTile(
//            title: new Text("Marks"),
//            trailing: new Icon(Icons.chevron_right),
//          ),
//          new Divider(),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  InkWell makeCont1(
      IconData _icon, String _name, String routeName, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8.0),
        child: new Container(
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black),
            color: Color(0xFFFCE4EC),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
              ),
            ],
          ),
          margin: const EdgeInsets.only(
              top: 15.0, left: 10.0, right: 10.0, bottom: 5.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(_icon),
                Text(
                  _name,
                  style: new TextStyle(
                    fontSize: 16
                  ),
                  ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _Drawer(),
      appBar: new AppBar(title: new Text("Home")),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: new Column(
              children: <Widget>[
                makeCont1(
                    Icons.done_outline, "Attendance", "/AttendancePage", context),
                makeCont1(Icons.book, "Library", "/LibraryPage", context),
                makeCont1(Icons.format_list_numbered, "GPA Calculator", "/CGPAPage",
                    context),
//          makeCont1(Icons.school, "Marks", "/LibraryPage", context)
        ],
      ),
          )),
    );
  }
}

class LibraryPage extends StatefulWidget {
  LibraryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  DateTime _date = new DateTime.now();
  DateTime _tdate = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2017),
      lastDate: new DateTime(2030),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        str1 = _date.day.toString() +
            "/" +
            _date.month.toString() +
            "/" +
            _date.year.toString();
      });
    }
  }

  String str1 = "";
  String str2 = "";

  Future<Null> _selecttDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _tdate,
      firstDate: new DateTime(2017),
      lastDate: new DateTime(2030),
    );

    if (picked != null && picked != _tdate) {
      setState(() {
        _tdate = picked;
        str2 = _tdate.day.toString() +
            "/" +
            _tdate.month.toString() +
            "/" +
            _tdate.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: _Drawer(),
      appBar: new AppBar(title: new Text("Library")),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Date of Issue: "),
                  Container(
                    width: 160.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black)),
                    child: Center(
                      child: new Text(
                        str1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  )
                ],
              ),
              new Divider(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Date of Issue: "),
                  Container(
                    width: 160.0,
                    height: 40.0,
                    decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.black)),
                    child: Center(
                      child: new Text(
                        str2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selecttDate(context),
                  )
                ],
              ),
              new Divider(),
              RaisedButton(
                child: Text("Issue"),
                onPressed: () {
                  int fine = _tdate.difference(_date).inDays - 14;
                  if (fine < 0) fine = 0;
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("You have to pay:\n₹" + fine.toString()),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendancePage extends StatefulWidget {
  AttendancePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _Drawer(),
      appBar: AppBar(title: Text("Attendance")),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: new Column(
            children: <Widget>[
              TextField(
                controller: myController1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.blue)),
                  hintText: 'Conducted Hours',
                ),
              ),
              new Divider(),
              TextField(
                controller: myController2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Bunked till now'),
              ),
              new Divider(),
              MaterialButton(
                child: Text("CALCULATE"),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                onPressed: () {
                  int con = int.parse(myController1.text);
                  int ab = int.parse(myController2.text);
                  int pr = con - ab;
                  int pp1 = 100 * pr;
                  double pp2 = (pp1 / con);
                  String s;
                  if (pp2 > 75) {
                    pp2 = (con - (4 * ab)) / 3;
                    s = "No. of classes you can leave:\n";
                  } else {
                    pp2 = ((4 * ab) - con).toDouble();
                    s = "No of classes you have to attend to reach 75%:\n";
                  }
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(s + pp2.toInt().toString()),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CGPAPage extends StatefulWidget {
  CGPAPage({Key key, this.title2}) : super(key: key);

  final String title2;

  @override
  _CGPAPageState createState() => _CGPAPageState();
}

class _CGPAPageState extends State<CGPAPage> {

  final List<TextEditingController> myController = List.generate(10, (i)=> TextEditingController() );

  @override
  void dispose() {
    for(int i=0;i<10;++i) {
      myController[i].dispose();
    }
    super.dispose();
  }

  List<String> grade = new List(10);

  int gradePoint(String grade){
    switch(grade){
      case 'O': return 10;
      case 'A+': return 9;
      case 'A': return 8;
      case 'B+': return 7;
      case 'B': return 6;
      case 'C': return 5;
      case 'P': return 4;
      case 'F': return 0;
      default: return 0;
    }
  }


  Padding makeRow(int indx) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0,5.0,2.0,5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 80,
            child:
//            TextField(
//              keyboardType: TextInputType.number,
//              controller: myController[indx],
//              decoration: InputDecoration(
//                hintText: 'Credits',
//              ),
//            ),
            CupertinoTextField(
              keyboardType: TextInputType.number,
              controller: myController[indx],
              placeholder: "Credits",
            ),
          ),
          Container(
              width: 120,
              child: new DropdownButton<String>(
                  value: grade[indx],
                  items: <String>['O','A+','A','B+','B','C','P','F'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  hint: new Text("Select Grade"),
                  onChanged: (String newValue) {
                    setState(() {
                      grade[indx]=newValue;
                    });
                  }
              )
          ),
        ],
      ),
    );
  }

  String gpaCalculation() {
    List<int> credits = new List(10);
    for(int i=0;i<10;++i) {
      try {
        credits[i] = int.parse(myController[i].text);
      }
      catch(_){
        credits[i]=0;
      }
    }
    int totalGradePoints = 0;
    int totalCredits = 0;
    for(int i=0;i<10;++i) {
      totalGradePoints = totalGradePoints +
          (gradePoint(grade[i])*credits[i]);
      totalCredits = totalCredits + credits[i];
    }
    double semesterGradePointAverage =
        totalGradePoints/totalCredits;
    return semesterGradePointAverage.toStringAsPrecision(3);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: _Drawer(),
      appBar: AppBar(title: Text("CGPA")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new ListView(
          children: <Widget>[

              makeRow(0),
              makeRow(1),
              makeRow(2),
              makeRow(3),
              makeRow(4),
              makeRow(5),
              makeRow(6),
              makeRow(7),
              makeRow(8),
              makeRow(9),
              Divider(),

//            MaterialButton(
//              child: Text("CALCULATE"),
//              color: Theme.of(context).accentColor,
//              elevation: 4.0,
//              onPressed: () {
//
//                String semesterGradePointAverageText = gpaCalculation();
//                return showDialog(
//                  context: context,
//                  builder: (context) {
//                    return AlertDialog(
//                      content: Text(semesterGradePointAverageText),
//                    );
//                  },
//                );
//              },
//            ),
            CupertinoButton(
              child: Text("CALCULATE"),
              color: Theme.of(context).accentColor,
              onPressed: (){
                String semesterGradePointAverageText = gpaCalculation();
                return showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Your GPA is \n\n"+semesterGradePointAverageText),
//                      content: Text(semesterGradePointAverageText),
                    );
                  },
                );
              },
            )

          ],
        ),
      ),
    );
  }
}
