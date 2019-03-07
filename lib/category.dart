import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';
import 'package:meta/meta.dart';
import 'package:unit_converter/converter_route.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(units != null),
        assert(iconLocation != null);

  void _navigateToConverter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(
                elevation: 1.0,
                title: Text(
                  name,
                  style: Theme.of(context).textTheme.display1,
                ),
                centerTitle: true,
                backgroundColor: color,
              ),
              body: ConverterRoute(
                color: color,
                name: name,
                units: units,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: color,
          borderRadius: _borderRadius,
          onTap: () {
            _navigateToConverter(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(
                  iconLocation,
                  size: 60.0,
                ),
              ),
              Center(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
