// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:expenses_manager/data/db/sqlite.dart' as _i4;
import 'package:expenses_manager/data/expenses_repository.dart' as _i5;
import 'package:expenses_manager/domain/usecases/add_expenses_usecase.dart'
    as _i3;
import 'package:expenses_manager/domain/usecases/delete_expenses_usecase.dart'
    as _i7;
import 'package:expenses_manager/domain/usecases/query_expenses_usecase.dart'
    as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AddExpensesUsecase>(() => _i3.AddExpensesUsecase());
    gh.singleton<_i4.DatabaseHelper>(_i4.DatabaseHelper());
    gh.factory<_i5.ExpensesRepository>(
        () => _i5.ExpensesRepository(dbCore: gh<_i4.DatabaseHelper>()));
    gh.factory<_i6.QueryExpensesUseCase>(() =>
        _i6.QueryExpensesUseCase(repository: gh<_i5.ExpensesRepository>()));
    gh.factory<_i7.DeleteExpensesUseCase>(() =>
        _i7.DeleteExpensesUseCase(repository: gh<_i5.ExpensesRepository>()));
    return this;
  }
}
