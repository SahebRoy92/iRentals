# iRentals
## Featues ---
- iOS 13+
- Universal App
- AutoLayout for Portrait and Landscape
- Localization English and German (Taken From Settings)
- Dark Mode Supported (Taken from System Settings)
- Viper Architecture
- No Storyboards used

### Libraries used
- Kingfisher : For async image download
- Lottie : For splash screen animation
- SwiftLint : For maintaining coding standards.

### Scenes Navigation 

 - Splash
 - Tabbar - [MapController | ListController]
 - MapController -> Tapping on Icon -> DetailController
 - ListController -> Tapping on Item -> DetailController
 

### Features Navigation 
- Dark Mode - Instant change of modes according to color scheme in XCAssets when dark mode is triggered in Settings from Device
- Portrait and Landscape Orientation - Instant change of Orientation as soon as device is rotated
- Language - German and English is supported and instant change of langauge when changed from Settings in Device.


### TODO 
- Test cases for Detail Scene and Map Scene needs to be written.

### Down the road
- Implement CLLocation and get users location
- Detail screen to show map and route from user's location to the selected vehicle
- Add Persistent storage for offline support
- ETA and other details ? Maybe
- Custom AnnotationView with more detailing? 
