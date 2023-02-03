import 'package:flutter/material.dart';

import '../exceptions/failure.dart';

class BaseProvider<T> extends ChangeNotifier {
  String? errorMessage;
  bool loading = false;
  T? data;
  Future onSuccess() async {
    loading = false;
    notifyListeners();
  }

  onLoading() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loading = true;
      notifyListeners();
    });
  }

  onError(Failure? failure) {
    String message;

    message = failure?.message;
    loading = false;

    notifyListeners();
  }
}

abstract class BaseView<T> {
  void onFailed(Failure? failure);
  onListLoaded(List<T> data);
}
