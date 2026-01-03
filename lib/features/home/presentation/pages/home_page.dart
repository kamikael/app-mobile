import 'package:flutter/material.dart';
import '/data/mock/mock_products.dart';
import '/data/models/product_model.dart';
import '/core/routes/app_router.dart';
import '../widgets/product_card.dart';
import '../widgets/category_filter.dart';
import '../widgets/banner_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = List.from(mockProducts);
  String selectedCategory = 'All';
  int currentIndex = 0;

  final List<String> categories = ['All', 'Women', 'Men', 'Kids', 'Pets'];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = selectedCategory.toLowerCase() == 'all'
        ? products
        : products
            .where(
              (p) => p.category.toLowerCase() ==
                  selectedCategory.toLowerCase(),
            )
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // 🔝 HEADER avec barre de recherche fonctionnelle
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Best Skincare',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Barre de recherche fonctionnelle
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.search, size: 20),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Navigation vers la page de recherche
                        showSearch(
                          context: context,
                          delegate: ProductSearchDelegate(products),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 20),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Navigation vers le panier
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Panier ouvert'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // 📦 CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🎯 HERO BANNER avec effet de fondu
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Stack(
                          children: [
                            const HeroBanner(),
                            // Effet de fondu sur l'image
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 📚 COLLECTIONS avec "See all" fonctionnel
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Collections',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Afficher tous les produits
                              setState(() {
                                selectedCategory = 'All';
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Affichage de toutes les collections'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // 🏷️ CATEGORY FILTER
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CategoryChip(
                              label: categories[index],
                              isSelected: selectedCategory == categories[index],
                              onTap: () {
                                setState(() {
                                  selectedCategory = categories[index];
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 🧴 PRODUCT GRID
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ProductCard(
                            product: product,
                            onFavoriteToggle: () {
                              setState(() {
                                final originalIndex = products
                                    .indexWhere((p) => p.id == product.id);
                                if (originalIndex != -1) {
                                  products[originalIndex] =
                                      products[originalIndex].copyWith(
                                    isFavorite:
                                        !products[originalIndex].isFavorite,
                                  );
                                }
                              });
                            },
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AppRouter.productDetails,
                                arguments: product,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // 🔻 BOTTOM NAV corrigé
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_rounded, 0, 'Home'),
          _buildNavItem(Icons.favorite_border_rounded, 1, 'Favorites'),
          _buildNavItem(Icons.shopping_bag_outlined, 2, 'Cart'),
          _buildNavItem(Icons.settings_outlined, 3, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String label) {
    final isSelected = currentIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });

        // Navigation selon l'index
        switch (index) {
          case 0:
            // Déjà sur Home, ne rien faire
            break;
          case 1:
            // Navigation vers Favorites
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Page Favoris'),
                duration: Duration(seconds: 1),
              ),
            );
            break;
          case 2:
            // Navigation vers Cart
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Page Panier'),
                duration: Duration(seconds: 1),
              ),
            );
            break;
          case 3:
            // Navigation vers Settings
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Page Paramètres'),
                duration: Duration(seconds: 1),
              ),
            );
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFB4D82E) : Colors.grey,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// Délégué de recherche pour la barre de recherche
class ProductSearchDelegate extends SearchDelegate<Product?> {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  String get searchFieldLabel => 'Rechercher un produit...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final product = results[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            close(context, product);
            Navigator.pushNamed(
              context,
              AppRouter.productDetails,
              arguments: product,
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(product.name),
          subtitle: Text('\$${product.price}'),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}