import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recesslibpjt/ignorethese/feature/favorite_page/viewModel/favorite_view_model.dart';
import 'package:recesslibpjt/ignorethese/feature/home_page/viewModel/home_view_model.dart';
import 'package:recesslibpjt/ignorethese/feature/login_register_page/viewModel/login_view_model.dart';
import 'package:recesslibpjt/ignorethese/feature/notification_page/viewModel/notification_view_model.dart';
import 'package:recesslibpjt/ignorethese/feature/profile_page/viewModel/profil_view_model.dart';
import 'package:recesslibpjt/ignorethese/feature/reservation_page/viewModel/reservation_view_model.dart';

class MultiProviderInit {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => NotificationViewModel()),
    ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
    ChangeNotifierProvider(create: (_) => ReservationViewModel()),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ];
}
