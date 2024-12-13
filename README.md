# Pokémon Card App

A Flutter application to display a list of Pokémon cards with features like search, pagination, and detailed views.

---

## **Features**
1. **Pokémon Card List**
   - Fetch cards using the Pokémon TCG API.
   - Display cards in a grid format (2x2) with pagination.

2. **Search**
   - Search for cards by their set name.

3. **Detailed Card View**
   - Display details such as:
     - Attack
     - Set
     - Type
     - Weakness
     - Artist
     - Other stats
   - Includes smooth animation when navigating to the detail page.

4. **App Routing**
   - Uses named routes for navigation.

5. **Image Caching**
   - Card images are cached for better performance and offline access.

6. **State Management**
   - Built using **GetX** for state management, navigation, and dependency injection.

---

## **Tech Stack**
- **Flutter**: UI Framework
- **GetX**: State management and routing
- **cached_network_image**: Image caching
- **http**: API calls

---

## **Setup Instructions**
1. Clone this repository:
   ```bash
   git clone https://github.com/narimetisaigopi/gravityer_pokemon_task.git
