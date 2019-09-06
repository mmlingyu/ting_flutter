
import 'package:annotation_route/route.dart';
import 'package:ainong/builder/arouterConfig.internal.dart';

@ARouteRoot()
class MyRouteOption{
  String urlpattern;
  Map<String, dynamic> params;
  MyRouteOption(this.urlpattern,this.params);



}
class ArouterConfig  {
   ARouterInternal internal = ARouterInternalImpl();
   ARouterResult getPage(MyRouteOption option) {
    //var option = ARouteOption(option.url, params);
    return internal.findPage(
        ARouteOption(option.urlpattern, option.params), option);
  }
}
