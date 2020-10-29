import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/ubais/AndroidStudioProjects/sample/lib/mvvm/mvvmExample.dart';
import 'package:rxdart/rxdart.dart';
import '../network.dart';

class HomeViewModel extends BaseViewModel{
  BehaviorSubject<String> _dataObservable = BehaviorSubject();
  Stream<String> get dataStream => _dataObservable.stream;

  @override
  void dispose(){
    _dataObservable.close();
  }

  @override
  void doInit(BuildContext context){
    refreshData(context);
  }

  @override
  Future refreshData(BuildContext context) {
    return NetWork.query().then((String text){
        _dataObservable.add(text);
    }).catchError((error){
      _dataObservable.addError(error);
    });
  }
  }
