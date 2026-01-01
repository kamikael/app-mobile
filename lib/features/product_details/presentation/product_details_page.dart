import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),

      body: Column(
        children: [
          /// 🧴 IMAGE PRODUIT
          Expanded(
            flex: 4,
            child: Center(
              child: Image.asset(
                widget.product.image,
                height: 260,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// 📦 CONTENU BAS (BLANC ARRONDI)
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NOM + PRIX
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.name,
                        style: AppTextStyle.title,
                      ),
                      Text(
                        "\$${widget.product.price}",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// ⭐ RATING
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      Icon(Icons.star_half, color: Colors.orange, size: 18),
                      SizedBox(width: 8),
                      Text(
                        "4.5",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  Text(
                    widget.product.description,
                    style: AppTextStyle.body.copyWith(
                      height: 1.6,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const Spacer(),

                  /// ➕ ➖ QUANTITÉ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() => quantity--);
                                }
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() => quantity++);
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),

                      /// 🛒 BUY NOW
                      SizedBox(
                        width: 160,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
