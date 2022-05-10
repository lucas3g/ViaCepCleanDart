import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:via_cep_clean_dart/app_widget.dart';
import 'package:via_cep_clean_dart/src/core/inject.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Inject.init();

      runApp(const AppWidget());
    },
    (error, st) => print(error),
  );
}
