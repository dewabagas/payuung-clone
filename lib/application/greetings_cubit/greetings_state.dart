part of 'greetings_cubit.dart';

@freezed
class GreetingsState with _$GreetingsState {
  const factory GreetingsState.initial() = _Initial;
  const factory GreetingsState.loadInProgress() = _LoadInProgress;
  const factory GreetingsState.loadSuccess(String greeting) = _LoadSuccess;
  const factory GreetingsState.loadFailure(String? message) = _LoadFailure;
}
