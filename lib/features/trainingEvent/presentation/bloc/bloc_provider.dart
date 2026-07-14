import 'package:nuevosol/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:nuevosol/features/trainingEvent/data/training_event_repo.dart';
import 'package:nuevosol/features/trainingEvent/model/training_employee.dart';
import 'package:nuevosol/features/trainingEvent/model/training_event.dart';


typedef TrainingEventCubit =
    InfiniteListCubit<TrainingEvent, Pair<int?, String?>, Pair<int?, String?>>;
typedef TrainingEventState = InfiniteListState<TrainingEvent>;

typedef Employess = NetworkRequestCubit<List<TrainingEmployee>, String>;
typedef EmployessState = NetworkRequestState<List<TrainingEmployee>>;


@lazySingleton
class TrainingEventBlocProvider {
  const TrainingEventBlocProvider(this.repo);

  final TrainingEventRepo repo;

  static TrainingEventBlocProvider get() => $sl.get<TrainingEventBlocProvider>();

  TrainingEventCubit fetchTraningEvent() => TrainingEventCubit(
  
    requestInitial:
        (params, state) => repo.fetchTraning(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchTraning(state.curLength, params!.first, params.second),
  );

  Employess fetchEmployess() => Employess(
    onRequest: (params, state) => repo.fetchEmployess(params ?? ''),
  );

}