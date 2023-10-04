import 'package:flutter/material.dart';
import 'package:jwt_store/jwt_store.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final JwtStore _jwtStore = JwtStore();
  String? accessToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(accessToken ?? "공백"),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  // await _jwtStore.save(
                  //     properties: JwtStoreProperties.accessToken,
                  //     token: "asdfsdfs");
                  accessToken = await _jwtStore.load(
                      properties: JwtStoreProperties.accessToken);
                  setState(() {});
                },
                child: Text("버튼"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
