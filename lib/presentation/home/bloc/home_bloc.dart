import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/usecases/home_usecases.dart';
import 'home_event.dart';
import 'home_state.dart';

/// **HomeBloc**
/// 
/// Coordinates the retrieval of all data required for the Home Screen.
/// Interacts with [GetTopCategoriesUseCase], [GetCategoriesUseCase], and [GetHomeItemsUseCase].
/// 
/// **Genius-Level Insight:**
/// To prevent waterfall fetching (A completes, then B starts, then C starts),
/// we utilize `Future.wait` to fire all UseCases simultaneously. This drastically
/// reduces screen loading time. If any single UseCase fails, we map it to a [HomeError] state.
@injectable
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
/// Manages state transitions and events for this feature block.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTopCategoriesUseCase _getTopCategories;
  final GetCategoriesUseCase _getCategories;
  final GetHomeItemsUseCase _getHomeItems;

