import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/theme/app_colors.dart';
import '../../widgets/luxeloft_logo.dart';
import '../../widgets/product_card.dart';

import '../../presentation/home/bloc/home_bloc.dart';
import '../../presentation/home/bloc/home_event.dart';
import '../../presentation/home/bloc/home_state.dart';
import '../../presentation/auth/bloc/auth_bloc.dart';
import '../../presentation/auth/bloc/auth_event.dart';
import '../../presentation/auth/bloc/auth_state.dart';
import '../auth/login_screen.dart';

/// Provides core implementation and business logic properties.
class HomeScreen extends StatefulWidget {
