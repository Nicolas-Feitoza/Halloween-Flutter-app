class Product {
  final int id;
  final String nome;
  final String emoji;
  final String descricao;
  final double preco;

  Product({
    required this.id,
    required this.nome,
    required this.emoji,
    required this.descricao,
    required this.preco,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nome: json['nome'],
      emoji: json['emoji'],
      descricao: json['descricao'],
      preco: (json['preco'] as num).toDouble(),
    );
  }
}
