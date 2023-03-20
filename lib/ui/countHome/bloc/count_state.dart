class CountState {}

class Loading extends CountState {}

class Success extends CountState {
  int count = 0;

  Success(this.count);
}
