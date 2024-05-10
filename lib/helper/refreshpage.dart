import 'package:shared_preferences/shared_preferences.dart';

class RefreshPage {
  Future < int > getOnce() async {
    int ? intValue;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String

    if (prefs.getInt("refreshpage") == null) {
      intValue = 0;
    } else {
      intValue = prefs.getInt("refreshpage");
    }



    return intValue!;
  }

  Future once(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //initScreen
    await prefs.setInt("refreshpage", num);

    int initScreen = (prefs.getInt("refreshpage")) !;
    print('refreshpage $initScreen');
    // return initScreen;
  }
}