import 'package:flutter/cupertino.dart';
import '../model/abstract_base_viewmodel.dart';

class ViewModelProvider<T extends BaseViewModel>extends StatefulWidget{
  final T viewModel;
  final Widget child;

  ViewModelProvider({
    @required this.viewModel,
    @required this.child,
  });

  static T of<T extends BaseViewModel>(BuildContext context){
    final type = _typeOf<ViewModelProvider<T>>();
    ViewModelProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.viewModel;
  }

  static Type _typeOf<T>() => T;

  @override
  _viewModelProviderState createState()=> _viewModelProviderState();
}

class _viewModelProviderState extends State<ViewModelProvider>{

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose(){
    widget.viewModel.dispose();
    super.dispose();
  }
}