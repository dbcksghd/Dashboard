import 'package:flutter/material.dart';
import 'package:network_module_example/presentation/view_model.dart';
import 'package:provider/provider.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late ViewModel provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ViewModel>(context);
    return Scaffold(
      body: Center(
        child: provider.entity.title == ""
            ? const CircularProgressIndicator()
            : Text(provider.entity.title.toString()),
      ),
    );
  }
}
