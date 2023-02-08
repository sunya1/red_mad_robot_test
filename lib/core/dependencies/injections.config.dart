// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:red_mad_robot_test/core/register_module.dart' as _i6;
import 'package:red_mad_robot_test/data/datasource/news_data_source.dart'
    as _i4;
import 'package:red_mad_robot_test/data/repository/news_repository.dart' as _i5;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i4.NewsDataSource>(() => _i4.NewsDataSource(gh<_i3.Dio>()));
    gh.factory<_i5.NewsRepository>(
        () => _i5.NewsRepository(gh<_i4.NewsDataSource>()));
    return this;
  }
}

class _$RegisterModule extends _i6.RegisterModule {}
