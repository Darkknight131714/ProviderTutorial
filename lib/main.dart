import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<data>(
      create: (context) {
        return data();
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: AppTitle(),
          ),
          body: Container(
            child: First(),
          ),
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<data>(context).myData);
  }
}

class First extends StatelessWidget {
  const First({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MyTextField(), Second()],
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        onChanged: (value) {
          Provider.of<data>(context, listen: false).changeData(value);
        },
      ),
      Text(Provider.of<data>(context, listen: false).myData),
    ]);
  }
}

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<data>(context).myData),
    );
  }
}

class data extends ChangeNotifier {
  String myData = "Hello";
  void changeData(String newData) {
    myData = newData;
    notifyListeners();
  }
}
