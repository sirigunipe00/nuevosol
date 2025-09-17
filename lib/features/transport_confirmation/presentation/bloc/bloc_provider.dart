import 'package:injectable/injectable.dart';
import 'package:nuevosol/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:nuevosol/core/di/injector.dart';
import 'package:nuevosol/core/model/pair.dart';
import 'package:nuevosol/features/transport_confirmation/data/transport_confrimation_repo.dart';
import 'package:nuevosol/features/transport_confirmation/model/transport_confirmation_form.dart';

typedef TransportCubit =
    InfiniteListCubit<TransportConfirmationForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef TtransportState = InfiniteListState<TransportConfirmationForm>;



@lazySingleton
class TransportCnfmBlocProvider {
  const TransportCnfmBlocProvider(this.repo);

  final TransportConfrimationRepo repo;

  static TransportCnfmBlocProvider get() => $sl.get<TransportCnfmBlocProvider>();

  TransportCubit fetchTransport() => TransportCubit(
    requestInitial:
        (params, state) => repo.fetchTransports(0, params!.first, params.second),
    requestMore:
        (params, state) =>
            repo.fetchTransports(state.curLength, params!.first, params.second),
  );
}