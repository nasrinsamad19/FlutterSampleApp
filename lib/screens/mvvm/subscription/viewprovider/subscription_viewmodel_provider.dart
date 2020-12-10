import 'dart:async';
import '../model/subscription_model.dart';
import 'package:email_validator/email_validator.dart';

class SubscriptionViewModelImpl implements SubscriptionViewModel {
  var _mailTextController = StreamController<String>.broadcast();

  @override
  Sink get inputMailText => _mailTextController;

  @override
  Stream<bool> get outputIsButtonEnabled =>
      _mailTextController.stream
          .map((email) => EmailValidator.validate(email));

  @override
  Stream<String> get outputErrorText =>
      outputIsButtonEnabled
          .map((isEnabled) => isEnabled ? null : "Invalid email");

  @override
  void dispose() => _mailTextController.close();
}