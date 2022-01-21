// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tema.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TemaStore on _TemaStore, Store {
  final _$clicadoAtom = Atom(name: '_TemaStore.clicado');

  @override
  bool get clicado {
    _$clicadoAtom.reportRead();
    return super.clicado;
  }

  @override
  set clicado(bool value) {
    _$clicadoAtom.reportWrite(value, super.clicado, () {
      super.clicado = value;
    });
  }

  final _$_TemaStoreActionController = ActionController(name: '_TemaStore');

  @override
  void clique() {
    final _$actionInfo =
        _$_TemaStoreActionController.startAction(name: '_TemaStore.clique');
    try {
      return super.clique();
    } finally {
      _$_TemaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clicado: ${clicado}
    ''';
  }
}
