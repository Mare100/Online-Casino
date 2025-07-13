//Gebaut von Marc

class AppState {
  static final AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  int sharedCounter = 0; //Globaler Counter in allen Datein zugreifbar
  int choice=0;
}