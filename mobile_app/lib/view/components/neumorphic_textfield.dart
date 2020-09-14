import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';

class NeumorphicTextfield extends StatelessWidget {
  var _hintText;
  NeumorphicTextfield({hintText}) {
    this._hintText = hintText;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Neumorphic(
        style: getlistItemNeuStyle(),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 1, 8, 1),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: _hintText,
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
  NeumorphicSearchbar({hintText, Function function}) {
    this._hintText = hintText;
    this._fnc = function;
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
                  padding: const EdgeInsets.fromLTRB(16, 1, 8, 1),
                  child: TextField(
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
