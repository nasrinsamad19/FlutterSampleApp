import 'package:flutter/material.dart';
import '../viewprovider/subscription_viewmodel_provider.dart';

class HomePage1 extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  SubscriptionViewModelImpl _viewModel;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
   controller.addListener(() => _viewModel.inputMailText.add(controller.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: StreamBuilder<String>(
            stream: _viewModel.outputErrorText,
            builder: (context, snapshot) {
              return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                      hintText: 'Email',
                  errorText:snapshot.data ),);
            },
          ),
        ),
        StreamBuilder(
            stream: _viewModel.outputIsButtonEnabled,
            builder: (context, snapshot) {
              return MaterialButton(onPressed: snapshot.data ?? false);
            }),
      ],
    );
  }
}

