import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'src/data/services/local/hive/adapter/adapters.dart';
import 'src/app.dart';
import 'src/domain/repositories/init.dart';
import 'src/data/services/local/hive/box/boxes.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialDependency();

  TasksBox.sort();
  await _debug();
  await Hive.deleteBoxFromDisk("tasks-box");


  initializeDateFormatting("id").then(
    (_) {
      runApp(
        App(
          authRepository: AuthRepository(),
          userRepository: UserRepository(),
        ),
      );
    },
  );
}

initialDependency() async {
  final appDocDirectory = await getApplicationDocumentsDirectory();

  await Hive.initFlutter(appDocDirectory.path);
  await initialAdapterHive();
  await initialHiveObject();
}

initialHiveObject() async {
  await AppSettingsBox.init();
  await AuthBox.init();

  await ActivityBox.init();
  await CategoryBox.init();
  await RepeatBox.init();
  await TagsBox.init();
  await TasksBox.init();
}

initialAdapterHive() async {
  Hive.registerAdapter(ActivityAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(RepeatAdapter());
  Hive.registerAdapter(TagsAdapter());
  Hive.registerAdapter(TasksAdapter());
}

_debug() async {}
