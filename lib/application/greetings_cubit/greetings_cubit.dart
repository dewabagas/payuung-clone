import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'greetings_state.dart';
part 'greetings_cubit.freezed.dart';

@injectable
class GreetingsCubit extends Cubit<GreetingsState> {
  GreetingsCubit() : super(const GreetingsState.initial());

  Future<void> getGreeting() async {
    try {
      emit(const GreetingsState.loadInProgress());
      final currentHour = DateTime.now().hour;
      String greeting;
      if (currentHour >= 5 && currentHour < 12) {
        greeting = "Selamat Pagi";
      } else if (currentHour >= 12 && currentHour < 15) {
        greeting = "Selamat Siang";
      } else if (currentHour >= 15 && currentHour < 18) {
        greeting = "Selamat Sore";
      } else {
        greeting = "Selamat Malam";
      }
      emit(GreetingsState.loadSuccess(greeting));
    } catch (e) {
      emit(GreetingsState.loadFailure(e.toString()));
    }
  }
}
