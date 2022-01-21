import 'package:mobx/mobx.dart';

part 'tema.store.g.dart';

class TemaStore = _TemaStore with _$TemaStore;

abstract class _TemaStore with Store {
  @observable
  bool clicado = true;

  @action
  void clique() {
    if (clicado == false) {
      clicado = true;
    } else {
      clicado = false;
    }
  }
}
