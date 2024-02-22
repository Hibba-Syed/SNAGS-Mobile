import 'package:flutter/material.dart';
import 'package:iskaan_inspections_mobile/iskaan_inspections.dart';
import 'package:iskaan_inspections_mobile/utils/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPreferences();
  runApp(const IskaanInspections());
}
