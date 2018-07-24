#  Deezer Sample

## Introduction

## Rules

### Features

[X] Create a small app that will list Deezer user's playlists.
[X] The playlists will be presented in a grid (3 colums) displaying playlist cover and title.
[X] When you click on a playlist you will display it.
[X] Display a playlist consist of displaying a header in a collapsing toolbar, showing playlist cover, title, author, formatted duration
[X] For listing the tracks, you have to lazy loading - load on scroll down.
[X] Track list display the title - artist name and formatted duration

### Requirements

Using Xcode
Using Swift 3,2 / 4
Using CocoaPods
Using MVVM
Using Libraries : RxSwift, Alamofire - pas de RxCocoa
Implement all the features above
Format duration: HH:mm:ss
ViewModel Unit testing

### API informations:

https://developers.deezer.com/api/explorer

GET user playlists : https://api.deezer.com/user/{userId}/playlists
GET playlist informations : https://api.deezer.com/playlist/{playlistId}
GET playlist tracks: https://api.deezer.com/playlist/{playlistId}/tracks

### Nice to have

Duration format testing.
