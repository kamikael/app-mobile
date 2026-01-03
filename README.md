### architecture de l'application

skincare_app/
├── lib/
│   ├── core/                                    # Tout ce qui est global et réutilisable dans toute l’app
│   │   ├── theme/
│   │   │   ├── app_colors.dart                  # Définit toutes les couleurs utilisées dans l’application (primaire, secondaire, gris, fond…)
│   │   │   ├── app_text_style.dart              # Définit les styles de texte : taille, poids, typographie (title, subtitle, body…)
│   │   │   └── theme.dart                       # Configure le ThemeData global de Flutter (couleurs, police, styles appliqués à toute l’app)
│   │   ├── routes/
│   │   │   └── app_router.dart                  # Gère la navigation entre les pages (déclare et relie toutes les routes)
│   │   └── utils/
│   │       └── constants.dart                   # Définit des constantes globales : margin, padding, radius, durées animations, etc.
│
│   ├── data/                                    # Tout ce qui touche aux données de l’application
│   │   ├── models/
│   │   │   └── product_model.dart               # Modèle Dart décrivant comment un produit est structuré (id, name, price, image, description…)
│   │   ├── mock/
│   │   │   └── mock_products.dart               # Données simulées (fake data) représentant une liste de produits comme une mini base de données locale
│   │   └── repository/
│   │       └── product_repository.dart          # Fournit les données aux pages (récupère les mock + prépare les données pour l’UI)
│
│   ├── state/                                   # Gestion des états (liste produits, favoris, panier…)
│   │   ├── product_provider.dart                # Gère l’état des produits : filtrage, récupération, favoris, recherche
│   │   └── cart_provider.dart                   # Gère le panier : ajout, suppression, quantité, total
│
│   ├── features/                                # Contient toutes les fonctionnalités principales de l’app (chaque écran = module indépendant)
│   │   ├── onboarding/
│   │   │   └── presentation/
│   │   │       └── pages/
│   │   │           └── onboarding_page.dart     # Première page affichée (image + bouton Get Started + navigation vers Home)
│   │
│   │   ├── home/
│   │   │   ├── presentation/
│   │   │   │   ├── pages/
│   │   │   │   │   └── home_page.dart          # Page principale : bannière, catégories, grille produits
│   │   │   │   └── widgets/
│   │   │   │       ├── banner_widget.dart       # Widget de la bannière verte "New Collection"
│   │   │   │       ├── category_filter.dart     # Boutons filtrage catégories (All, Women, Men…)
│   │   │   │       └── product_card.dart        # Carte produit (image + prix + favoris + navigation vers détails)
│   │
│   │   ├── product_details/
│   │   │   └── presentation/
│   │   │       └── product_details_page.dart    # Page détail d’un produit (image, prix, texte, +/-, Buy Now)
│
│   ├── main.dart                                # Point d’entrée de l’application : initialise app, thème, routes, providers
│
├── assets/
│   ├── images/                                  # Stocke toutes les images de l’app (produits, bannière, illustrations)
│
├── pubspec.yaml                                 # Fichier de configuration Flutter (packages, assets, dépendances)


