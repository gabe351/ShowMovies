# Show movies

This is a simple app to search for movies using [TMDb api](https://www.themoviedb.org/)

![Swift Version](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat-square)


### Requirements

What you need to run this project:

* Xcode 9.2
* [CocoaPods - Installation Guide](https://guides.cocoapods.org/using/getting-started.html)

### Installing instructions

```bash
sudo gem install cocoapods
git clone https://github.com/gabe351/ShowMovies.git
cd ShowMovies
pod install
open ShowMovies.xcworkspace
```

## Running instructions

CMD + R to run the project.

CMD + U to run tests.

## Libraries used
* [Alamofire](https://github.com/Alamofire/Alamofire) -> Used to execute API requests.
* [AlamofireObjectMapper](https://github.com/tristanhimmelman/AlamofireObjectMapper) -> An Alamofire extension which converts JSON response data into swift objects using ObjectMapper.
* [UIColor_Hex_Swift](https://github.com/yeahdongcn/UIColor-Hex-Swift) -> Convenience methods for creating color using RGBA hex string.
* [SDWebImage](https://github.com/rs/SDWebImage) -> Asynchronous image downloader with cache support as a UIImageView category.
* [Quick](https://github.com/Quick/Quick) -> Behavior-driven development framework for Swift and Objective-C.
* [Nimble](https://github.com/Quick/Nimble) -> A Matcher Framework for Swift and Objective-C.

## Next updates

- Add RX Swift to optimize requests
- Add multiple language support
- Add notifications to new releases
- Add save favorite movies locally

## Gallery

### New releases
<p>
<img src="https://github.com/gabe351/ShowMovies/blob/develop/screenshots/Screen%20Shot%202018-08-27%20at%2019.49.09.png" width="150">
</p>

### Search Movies
<p>
<img src="https://github.com/gabe351/ShowMovies/blob/develop/screenshots/Screen%20Shot%202018-08-27%20at%2019.49.39.png" width="150">
</p>

### Movie Detail
<p>
<img src="https://github.com/gabe351/ShowMovies/blob/develop/screenshots/Screen%20Shot%202018-08-27%20at%2019.50.12.png" width="150">
</p>


