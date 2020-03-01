import 'package:intl/locale.dart';
import 'package:mobx/mobx.dart';
import 'package:quran_app/baselib/command.dart';
import '../../baselib/localization_service.dart';
import 'package:rx_command/rx_command.dart';

import '../../baselib/app_services.dart';
import '../../baselib/base_store.dart';
import '../../main.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore extends BaseStore with Store {
  var _appServices = sl.get<AppServices>();
  var _localizationService = sl.get<ILocalizationService>();

  _SplashStore({
    AppServices appServices,
    ILocalizationService localizationService,
  }) {
    _appServices = appServices ?? _appServices;
    _localizationService = localizationService ?? _localizationService;

    initialize = Command(() async {
      // Load localization
      await _localizationService.loadFromBundle(Locale.parse('en'));

      await _appServices.navigatorState.pushNamedAndRemoveUntil(
        '/home',
        (_) => false,
      );
    });
  }

  Command initialize;
}