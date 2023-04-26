import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginClear() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('id');
  await prefs.remove('pw');
}
