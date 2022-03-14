import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

String serialized_number(List textController) {
  var _string = "";

  for (int i=0; i<9; ++i) {
    for (int j=0; j<9; ++j) {
      var c = textController[i][j].text;
      if (c == "") {_string += "0";}
      else {_string += c;};
    }
  }
  return _string;
}

void fetchSudokuAnswer(List textController) async {
  const url = "http://127.0.0.1:5000/sudoku";
  String _string = serialized_number(textController);

  try {
    var jsonMap = {"numbers": _string};
    String jsonStr = jsonEncode(jsonMap);

    print(jsonStr);

    final response = await http.post(Uri.parse(url),
      body: jsonMap,
    );

    if (response.statusCode == 200) {
      Sudoku sdk = Sudoku.fromJson(jsonDecode(response.body));
      print(sdk.numbers);

      for(int i=0; i<9; ++i) {
        for(int j=0; j<9; ++j) {
          textController[i][j].text = sdk.numbers[9*i+j];
        }
      }
    }
  } catch(error) {
    print(error);
    throw(error);
  }
}

void reset(List textController) {
  for(int i=0; i<9; ++i) {
    for(int j=0; j<9; ++j) {
      textController[i][j].text = "";
    }
  }
}

class Sudoku {
  final numbers;

  const Sudoku({
    required this.numbers,
  });

  factory Sudoku.fromJson(Map<String, dynamic> json) {
    return Sudoku(
      numbers: json["numbers"],
    );
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controllers = List.generate(9, (index) => List.generate(9, (index) => TextEditingController()));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.favorite),
          title: Text("Sudoku Solver"),
        ),
        body: Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(30.0),
          child: Table(
            border: TableBorder.all(),
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TextField(
                    controller: _controllers[0][0],
                    style: TextStyle(
                      fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counter: SizedBox(height: 0.0,),
                      border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                  ),
                  TextField(
                    controller: _controllers[0][1],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][2],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][3],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][4],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][5],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][6],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][7],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  TextField(
                    controller: _controllers[0][8],
                    style: TextStyle(
                        fontSize: 30.0
                    ),
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        counter: SizedBox(height: 0.0,),
                        border: InputBorder.none
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[1][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[1][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[2][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[2][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[3][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[3][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[4][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[4][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[5][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[5][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[6][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[6][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[7][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[7][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
              TableRow(
                  children: <Widget>[
                    TextField(
                      controller: _controllers[8][0],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][1],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][2],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][3],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][4],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][5],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][6],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][7],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    TextField(
                      controller: _controllers[8][8],
                      style: TextStyle(
                          fontSize: 30.0
                      ),
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          counter: SizedBox(height: 0.0,),
                          border: InputBorder.none
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ]
              ),
            ],
          )
          ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: TextButton(
                  onPressed: (){fetchSudokuAnswer(_controllers);},
                  child: Text("Solve",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    ),
                  ))),
              Expanded(child: TextButton(
                  onPressed: (){reset(_controllers);},
                  child: Text("Reset",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                    ),
                  )
              ))
            ],
          ),
          ),
        ),
      );
  }
}


