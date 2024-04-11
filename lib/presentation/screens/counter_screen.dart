import 'package:flutter/material.dart';
import 'package:flutter_demo_1/componentes/custom_button.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int countClicked = 0;

  @override
  Widget build(BuildContext context) {
    String title =
        (countClicked == 1 || countClicked == 0) ? 'Click' : 'Clicks';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Counter Screen'),
          leading: IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () {
              setState(() {
                countClicked = 0;
              });
            },
          )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
              icon: Icons.plus_one,
              onPressed: () {
                setState(() {
                  countClicked++;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              icon: Icons.exposure_minus_1_sharp,
              onPressed: () {
                if (countClicked >= 1) {
                  setState(() {
                    countClicked--;
                  });
                }
              }),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$countClicked',
              style: const TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(title, style: const TextStyle(fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
