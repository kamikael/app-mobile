# 🌿 Skincare App — Flutter UI Project

Application mobile **e-commerce skincare** développée avec **Flutter**, basée sur une maquette moderne et premium.  
Le projet met l’accent sur une **UI fidèle**, une **architecture propre**, et une **bonne collaboration en équipe**.

---

## ✨ Aperçu du projet

Skincare App est une application mobile permettant de :
- Découvrir des produits cosmétiques
- Parcourir des collections par catégories
- Voir les détails d’un produit
- Ajouter des produits aux favoris et au panier
- Naviguer dans une interface fluide et élégante

🎯 Objectif principal : **reproduire fidèlement une maquette UI professionnelle en Flutter**.

---

## 📱 Écrans implémentés

- 🟢 **Onboarding**
- 🟢 **Home (Collections & Produits)**
- 🟢 **Product Details**
- 🟢 **Bottom Navigation**
- 🟢 **Recherche (UI prête)**
- 🟢 **Mock Data & State Management**

---

## 🧱 Architecture du projet

Le projet suit une **architecture modulaire et scalable**, inspirée de Clean Architecture.

lib/
├── core/
│ ├── theme/
│ │ ├── app_colors.dart
│ │ ├── app_text_style.dart
│ │ └── theme.dart
│ ├── routes/
│ │ └── app_router.dart
│ └── utils/
│ └── constants.dart
│
├── data/
│ ├── models/
│ │ └── product_model.dart
│ ├── mock/
│ │ └── mock_products.dart
│ └── repository/
│ └── product_repository.dart
│
├── state/
│ ├── product_provider.dart
│ └── cart_provider.dart
│
├── features/
│ ├── onboarding/
│ │ └── presentation/pages/onboarding_page.dart
│ │
│ ├── home/
│ │ └── presentation/
│ │ ├── pages/home_page.dart
│ │ └── widgets/
│ │ ├── banner_widget.dart
│ │ ├── category_filter.dart
│ │ └── product_card.dart
│ │
│ ├── product_details/
│ │ └── presentation/product_details_page.dart
│
├── main.dart

markdown
Copier le code

---

## 👥 Organisation de l’équipe

Projet réalisé par **5 développeurs**, chacun responsable d’un module précis.

### 👨‍💻 Dev 1 — Architecture & Setup *(Kami)*
- Initialisation Flutter
- Architecture des dossiers
- Routing
- Thème global
- Configuration des packages

### 🎨 Dev 2 — Onboarding UI *(Fati)*
- Écran d’introduction
- Bouton *Get Started*
- Navigation vers Home

### 🏠 Dev 3 — Home UI *(Jaesan)*
- Banner "New Collection"
- Catégories
- Grille des produits
- Cartes produit

### 📦 Dev 4 — Product Details *(Maelle)*
- Page détail produit
- Quantité
- Bouton *Buy Now*

### 🧠 Dev 5 — Data & State *(Hora)*
- Models
- Mock JSON
- Repository
- Gestion panier & favoris

---

## 🌱 Stack technique

- **Flutter** (Stable)
- **Dart**
- **Material UI**
- **State Management** (Provider / Riverpod / équivalent)
- **Mock Data (JSON local)**
- **Architecture modulaire**

---

## ▶️ Lancer le projet

### Prérequis
- Flutter SDK installé
- Chrome (pour Flutter Web) ou Android Emulator

### Commandes

```bash
flutter pub get
flutter run -d chrome
🎨 UI & Design
UI pixel-accurate basée sur une maquette moderne

Palette verte naturelle

Design minimal & premium

Cartes arrondies

Navigation fluide

🚀 Améliorations possibles
Animations (Hero, transitions)

Backend réel (API REST)

Authentification utilisateur

Paiement

Dark mode

📄 Licence
Projet académique / pédagogique.
Libre d’utilisation à des fins d’apprentissage.

🤝 Remerciements
Merci à toute l’équipe pour la collaboration et la rigueur dans le développement.

Skincare App — Built with Flutter 💚