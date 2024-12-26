import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/home_repo_impl.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepoImpl homeRepo;

  HomeCubit(this.homeRepo) : super(InitialHome()) {
    fetchHomeData(); // Fetch data when the cubit is created
  }

  Future<void> fetchHomeData() async {
    emit(LoadingHome());
    final result = await homeRepo.fetchHomeData();
    result.fold(
          (failure) {
            print("Error occurred: ${failure.errMessage}");

            emit(FailureHome(errMessage: failure.errMessage));
          }, // Emit failure state

          (products) => emit(SuccessHome( products: products)), // Emit success state
    );
  }
}