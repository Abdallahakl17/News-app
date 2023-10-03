abstract class NewsState {}

class InailStateNews extends NewsState {}

class ChangeNavBottom extends NewsState {}

class LoadingBusinessState extends NewsState {}

class SuccessBusinessState extends NewsState {}

class ErorrBusinessState extends NewsState {
  final String erorr;
  ErorrBusinessState(this.erorr);
}
