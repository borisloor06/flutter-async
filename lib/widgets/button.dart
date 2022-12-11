import 'package:flutter/material.dart';

class AwaitButton extends StatefulWidget {
  final Function fun;
  final Color color;
  final String img;
  final int duration;

  const AwaitButton(
      {super.key,
      required this.fun,
      this.color = Colors.blue,
      required this.duration,
      required this.img});

  @override
  State<AwaitButton> createState() => _AwaitButtonState();
}

class _AwaitButtonState extends State<AwaitButton> {
  bool selected = false;
  bool finished = false;
  // int duration = 0;
  String text = '';

  getData() async {
    widget.fun().then((value) => setState(() {
          text = value.toString();
        }));
  }

  @override
  Widget build(BuildContext context) {
    // double width = 0;
    return GestureDetector(
        onTap: () {
          setState(() {
            getData();
            selected = !selected;
          });
        },
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100.0,
                width: 100.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: widget.color),
                child: Center(
                  child: Image.network(
                    widget.img,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              AnimatedContainer(
                width: selected ? 250.0 : 0.0,
                height: 30.0,
                color: widget.color,
                alignment: AlignmentDirectional.center,
                duration: selected
                    ? Duration(seconds: widget.duration)
                    : const Duration(seconds: 0),
                onEnd: () => setState(
                  () {
                    selected = false;
                    finished = true;
                  },
                ),
              ),
              Text(
                finished ? text : '0',
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
