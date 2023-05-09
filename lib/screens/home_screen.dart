import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Providers"),
        ),
        body: Consumer<Model>(builder: ((context, model, child) {
          return Column(
            children: [
              Center(
                child: Text(model.name),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ElevatedButton(
                onPressed: () {
                  model.changeName();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                child: const Text(
                  "Do Something",
                ),
              ),
            ],
          );
        })),
      ),
    );
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";
  changeName() {
    name = "Ahmed";
    notifyListeners();
  }
}
