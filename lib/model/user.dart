class UserFields {
  static final String datacompra = 'Data';
  static final String produto = 'Produto';
  static final String preco = 'Preco';
  static final String pagamento = 'Pagamento';

  static List<String> getFields() => [datacompra, produto, preco, pagamento];
}

class User {
  final String? datacompra;
  final String produto;
  final String preco;
  final String pagamento;

  const User({
    this.datacompra,
    required this.produto,
    required this.preco,
    required this.pagamento,
  });

  Map<String, dynamic> toJson() => {
        UserFields.datacompra: datacompra,
        UserFields.produto: produto,
        UserFields.preco: preco,
        UserFields.pagamento: pagamento,
      };
}
