# Looca

**Looca** is a SwiftUI-based indoor navigation app designed to help users find their way to food courts in large building complexes. The app provides step-by-step navigation using a combination of ARKit and CoreLocation, ensuring precise direction even in offline environments like basements or parking areas.

## 🧭 Key Features

- ✅ **Offline Indoor Navigation**  
  Works completely offline with a fixed starting point to ensure consistent orientation.

- 🔄 **Step-by-Step Checkpoint Navigation**  
  Users are guided through a series of predefined checkpoints with clear directions, distance info, and visual cues.

- 🗺️ **Location Awareness**  
  Uses **CoreLocation** for proximity updates and directional feedback even without internet access.

- 📦 **Modular SwiftUI Architecture**  
  Components like `StepNavigationView` and `NavigationViewModel` are cleanly separated for reusability and clarity.

---

## 🛠️ Tech Stack

- **SwiftUI** – declarative UI framework
- **CoreLocation** – geolocation and heading data
- **MapKit** (optional) – for overlay or debugging routes
