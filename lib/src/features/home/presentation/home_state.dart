// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeState {
  final int? currentIndex;
  HomeState({
    this.currentIndex = 0,
  });

  HomeState copyWith({
    int? currentIndex,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
