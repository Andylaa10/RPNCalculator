import 'package:flutter/material.dart';

class ActionButtons extends StatefulWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  final double sizeBoxHeight = 75;
  final double sizeBoxWidth = 75;
  final Color buttonsColor = Colors.white10;
  final double globalPadding = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(globalPadding),
            child: InkWell(
              onTap: () {
                print('object');
              },
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white10.withAlpha(20),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: new Center(
                    child: new Text(
                      "Enter",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(globalPadding),
            child: InkWell(
              onTap: () {
                print('Clear');
              },
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white10.withAlpha(20),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: new Center(
                    child: new Text(
                      "Clear",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '1',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '2',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '3',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '4',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '5',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '6',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '-',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '7',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '8',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '9',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '/',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: InkWell(
                  onTap: () {
                    print('Undo');
                  },
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Container(
                    height: sizeBoxHeight,
                    width: 175,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10.withAlpha(20),
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: new Center(
                        child: new Text(
                          "Undo",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 40,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '0',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(globalPadding),
                child: SizedBox(
                  height: sizeBoxHeight,
                  width: sizeBoxWidth,
                  child: FloatingActionButton(
                    backgroundColor: buttonsColor,
                    onPressed: () {},
                    child: Text(
                      '*',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue.shade700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
