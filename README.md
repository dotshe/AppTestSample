#  Deezer Sample

## Introduction

## Rules

### Features

- [x] Create a small app that will list Deezer user's playlists.
- [x] The playlists will be presented in a grid (3 colums) displaying playlist cover and title.
- [x] When you click on a playlist you will display it.
- [x] Display a playlist consist of displaying a header in a collapsing toolbar, showing playlist cover, title, author, formatted duration
- [x] For listing the tracks, you have to lazy loading - load on scroll down.
- [x] Track list display the title - artist name and formatted duration

### Requirements

- [x] Using Xcode ==> Version 9.4.1 (9F2000)
- [x] Using Swift 3,2 / 4 ==> 4
- [x] Using CocoaPods
- [x] Using MVVM
- [x] Using Libraries : RxSwift, Alamofire - pas de RxCocoa
- [x] Implement all the features above
- [x] Format duration: HH:mm:ss
- [ ] ViewModel Unit testing

### API informations:

https://developers.deezer.com/api/explorer

GET user playlists : https://api.deezer.com/user/{userId}/playlists
GET playlist informations : https://api.deezer.com/playlist/{playlistId}
GET playlist tracks: https://api.deezer.com/playlist/{playlistId}/tracks

### Nice to have

Duration format testing.

## Dependencies

Cocoapods is used to manage dependencies.
Current dependencies in the application:

* [Alamofire](https://github.com/Alamofire/Alamofire) => for HTTP networking
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage) => image component library
* [RxSwift](https://github.com/ReactiveX/RxSwift) => for reactive programming 
* [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) => for loading animations

To install new dependencies:

    pod install

To update dependencies:

    pod update

## TODO

1. Fix the warning concerning `Variable` deprecation and Rx
2. Add transition animation between playlists scene and playlist detail scene
3. Manage users
4. Replace `static let deezerAPI` in repositories
5. Fix `TODO(CPO)`
6. Manage error/empty in scenes
7. Add more tests on ViewModels

