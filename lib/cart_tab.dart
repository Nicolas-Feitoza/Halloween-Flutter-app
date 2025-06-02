import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'providers/cart_provider.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cart = cartProvider.cart;
        final total = cartProvider.totalPrice;

        if (cart.isEmpty) {
          // Exibe animação Lottie quando o carrinho está vazio
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/ghost.json', width: 150, repeat: true),
                const SizedBox(height: 16),
                const Text(
                  'Seu carrinho está vazio!',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ],
            ),
          );
        }

        // Se não estiver vazio, mostra os itens normalmente
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Card(
                    color: Colors.deepPurple[900],
                    margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Text(item.emoji, style: const TextStyle(fontSize: 36)),
                      title: Text(
                        item.nome,
                        style: const TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        'R\$ ${item.preco.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple[900],
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrangeAccent.withAlpha((0.6 * 255).toInt()),
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Text(
                        'R\$ ${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cartProvider.clearCart();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Compra realizada com sucesso!'),
                            backgroundColor: Colors.deepOrangeAccent,
                          ),
                        );
                      },
                      child: const Text('Finalizar Compra'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
