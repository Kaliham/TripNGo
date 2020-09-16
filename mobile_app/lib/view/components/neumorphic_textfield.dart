import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class NeumorphicTextfield extends StatefulWidget {
  var _hintText;

  TextInputType _textType;
  bool ob;
  TextEditingController controller;
  NeumorphicTextfield({
    hintText,
    TextInputType dataType: TextInputType.text,
    controller,
    ob = false,
  }) {
    this._hintText = hintText;
    this._textType = dataType;
    this.ob = ob;
    this.controller = controller;
  }

  @override
  _NeumorphicTextfieldState createState() => _NeumorphicTextfieldState();
}

class _NeumorphicTextfieldState extends State<NeumorphicTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: Container(
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: TextField(
                controller: widget.controller,
                obscureText: widget.ob,
                keyboardType: widget._textType,
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget._hintText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NeumorphicSearchbar extends StatefulWidget {
  var _hintText;
  Function _fnc;
  TextInputType _textType;
  NeumorphicSearchbar(
      {hintText,
      Function function,
      TextInputType dataType: TextInputType.text}) {
    this._hintText = hintText;
    this._fnc = function;
    this._textType = dataType;
  }

  @override
  _NeumorphicSearchbarState createState() => _NeumorphicSearchbarState();
}

class _NeumorphicSearchbarState extends State<NeumorphicSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 1, 8, 1),
                  child: TextField(
                    keyboardType: widget._textType,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget._hintText,
                    ),
                  ),
                ),
              ),
              NeumorphicButton(
                child: Icon(Icons.filter_list),
                onPressed: () {
                  widget._fnc();
                },
                style: getlistItemNeuStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
