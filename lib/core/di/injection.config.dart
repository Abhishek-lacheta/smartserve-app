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
