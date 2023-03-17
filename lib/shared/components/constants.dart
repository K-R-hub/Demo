

// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//

import '../../modules/shop_app/login/login_screen.dart';
import '../network/local/cache_helper.dart';
import 'components.dart';

void signOut(context){
  CacheHelper.removeData(key: 'token').then((value) {
    goToScreenAndFinish(context, ShopLoginScreen());
  });
}

String? token = '';
