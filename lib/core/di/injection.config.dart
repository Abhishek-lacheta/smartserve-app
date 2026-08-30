// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i4;

import '../../data/datasources/firebase_auth_datasource.dart' as _i5;
import '../../data/datasources/firestore_datasource.dart' as _i6;
import '../../data/repositories/auth_repository_impl.dart' as _i8;
import '../../data/repositories/home_repository_impl.dart' as _i10;
import '../../domain/repositories/i_auth_repository.dart' as _i7;
import '../../domain/repositories/i_home_repository.dart' as _i9;
import '../../domain/usecases/auth_usecases.dart' as _i11;
import '../../domain/usecases/home_usecases.dart' as _i12;
import '../../presentation/auth/bloc/auth_bloc.dart' as _i13;
import '../../presentation/home/bloc/home_bloc.dart' as _i14;
import 'register_module.dart' as _i15;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i4.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i4.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.lazySingleton<_i2.FirebaseFirestore>(() => registerModule.firestore);
    
    gh.lazySingleton<_i5.FirebaseAuthDataSource>(
        () => _i5.FirebaseAuthDataSource(firebaseAuth: gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i6.FirestoreDataSource>(
        () => _i6.FirestoreDataSource(firestore: gh<_i2.FirebaseFirestore>()));
        
    gh.lazySingleton<_i7.IAuthRepository>(() => _i8.AuthRepositoryImpl(
          gh<_i5.FirebaseAuthDataSource>(),
          gh<_i6.FirestoreDataSource>(),
        ));
    gh.lazySingleton<_i9.IHomeRepository>(
        () => _i10.HomeRepositoryImpl(gh<_i6.FirestoreDataSource>()));
        
    gh.factory<_i11.SignInWithGoogleUseCase>(
        () => _i11.SignInWithGoogleUseCase(gh<_i7.IAuthRepository>()));
    gh.factory<_i11.SignOutUseCase>(
        () => _i11.SignOutUseCase(gh<_i7.IAuthRepository>()));
    gh.factory<_i11.GetCurrentUserUseCase>(
        () => _i11.GetCurrentUserUseCase(gh<_i7.IAuthRepository>()));
    gh.factory<_i11.GetAuthStateChangesUseCase>(
        () => _i11.GetAuthStateChangesUseCase(gh<_i7.IAuthRepository>()));
        
    gh.factory<_i12.GetTopCategoriesUseCase>(
        () => _i12.GetTopCategoriesUseCase(gh<_i9.IHomeRepository>()));
    gh.factory<_i12.GetCategoriesUseCase>(
        () => _i12.GetCategoriesUseCase(gh<_i9.IHomeRepository>()));
    gh.factory<_i12.GetHomeItemsUseCase>(
        () => _i12.GetHomeItemsUseCase(gh<_i9.IHomeRepository>()));
        
    gh.factory<_i13.AuthBloc>(() => _i13.AuthBloc(
          gh<_i11.SignInWithGoogleUseCase>(),
          gh<_i11.SignOutUseCase>(),
          gh<_i11.GetAuthStateChangesUseCase>(),
        ));
    gh.factory<_i14.HomeBloc>(() => _i14.HomeBloc(
          gh<_i12.GetTopCategoriesUseCase>(),
          gh<_i12.GetCategoriesUseCase>(),
          gh<_i12.GetHomeItemsUseCase>(),
        ));
    return this;









  }
}

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class _$RegisterModule extends _i15.RegisterModule {}
