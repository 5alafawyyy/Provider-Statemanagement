import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProveOne(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Providers"),
        ),
        body: ListView(
          children: [
            Consumer<ProveOne>(builder: (context, proveone, child) {
              print("Consumer text1");
              return Text(proveone.showsomething1);
            }),Consumer<ProveOne>(builder: (context, proveone, child) {
              print("Consumer text2");

              return Text(proveone.showsomething1);
            }),
            const SizedBox(
              height: 10.0,
            ),
            Consumer<ProveOne>(
              builder: (context, proveone, child) {
                print("Consumer button");

                return ElevatedButton(
                  onPressed: () {
                    proveone.dosomething();
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  child: const Text(
                    "Do Something",
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProveOne extends ChangeNotifier {
  String showsomething1 = "show something";
  String showsomething2 = "show something";
  dosomething() {
    showsomething1 = "Yes Provider";
    notifyListeners();
  }
}
