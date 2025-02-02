import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'app.dart';
import 'core/env.dart';
import 'core/singletons.dart';

const DEFAULT_WIDTH = 1200.0;
const DEFAULT_HEIGHT = 800.0;

const MIN_WIDTH = 1000.0;
const MIN_HEIGHT = 600.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  await initSingletons();

  if (!kIsWeb && Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(DEFAULT_WIDTH, DEFAULT_HEIGHT));
    await DesktopWindow.setMinWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
  }

  tz.initializeTimeZones();

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: ProviderScope(
      child: App(),
    ),
  ));
}
