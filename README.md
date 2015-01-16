# Swift First Cut - Introduction for Objective-C Developers

These are the project files and companion materials for the Philly Cocoa: Starting Swift workshop that took place in January 2015.

The interactive **(better)** version of the slides can be viewed [here](http://slides.com/tompiarulli/starting-swift/).

## The Hosts

Special thanks to our wonderful hosts.

**Instructor - Tom Piarulli**
* Twitter: [@tompark_io](http://twitter.com/tompark_io)
* Website: http://tompark.io

**TA - Amit Rao**
* Twitter: [@amitmrao](http://twitter.com/amitmrao)

**TA - Kotaro Fujita**
* Twitter: [@wild37](http://twitter.com/wild37)
* Website: http://tomatoboy.co

**Venue Sponsor - Indy Hall**
* Twitter: [@indyhall](http://twitter.com/indyhall)
* Website: http://indyhall.org

## The Project - Swift Movies

<img src="https://github.com/tompiarulli/starting-swift/raw/master/screenshot.png" width="800" />

The goal of the workshop was to create something:

* **Functional** - not a "proof-of-concept" or "micro-app", an actual app
* **Polished** - proper loading indicators, error handling, fallbacks for missing data, etc.
* **Fun** - something you would actually want to build

## Additional Reading

This is a list of the articles, websites, books, etc. that served as inspiration for the materials in this workshop. They are great supplementary materials to continue your journey with Swift.

### Blogs/Resource Lists

* [Introducing Swift](https://developer.apple.com/swift/) - Apple's official Swift website - there is a blog as well as a number of official articles and videos.

* [Design + Code](https://designcode.io/learn) - My favorite resource list. Not only does it contain many great Swift resources, but it contains useful design resources as well.

* [That Thing in Swift](https://thatthinginswift.com) - A listing of articles describing how common Objective-C patterns translate to Swift.

* [Swift Developer Weekly](http://swiftdevweekly.co) - A weekly email newsletter containing interesting Swift articles.

* [Learn Swift - Tips](http://www.learnswift.tips) - An extensive list of Swift learning resources, grouped by skill level.

* [Favorite Swift Tips & Tricks of 2014](http://realm.io/news/favorite-swift-tips-and-tricks-of-2014/) - One of my favorite lists - some really outstanding Swift articles contained here.

* [Alexandros Salazar](http://nomothetis.svbtle.com) - Alexandros has published some of the interesting and useful articles I've encountered regarding Swift.

* [Natasha the Robot](http://natashatherobot.com) - Another blog containing some really excellent Swift articles.

* [Swift Tips](https://github.com/jbrennan/swift-tips/blob/master/swift_tips.md) - A Github repo containing some Swift tips - you can do a pull request to contribute your own.

* [We Heart Swift](http://www.weheartswift.com) - A new blog containing a number of Swift articles and resources.

* [Swiftcast](https://swiftcast.tv) - A new blog containing Swift articles, screencasts, and podcasts.

### Books/Courses

* [Swift by Tutorials](http://www.raywenderlich.com/store/swift-by-tutorials) - A great introductory book for those who already have Objective-C experience.

* [iOS 8 by Tutorials](http://www.raywenderlich.com/store/ios-8-by-tutorials) - This book includes Swift tutorials designed to help you learn the new APIs in iOS 8.

* [The iOS Apprentice](http://www.raywenderlich.com/store/ios-apprentice) - This book is aimed at beginners - great if you are new to both Swift and iOS programming.

* [Beginning iOS Programming with Swift](http://www.appcoda.com/swift/) - This book is aimed at beginners but also comes with an intermediate book for those already familiar with iOS.

* [The Complete iOS 8 Course with Swift](http://bitfountain.io/course/complete-ios8/) - A course containing 350+ videos that takes you through building 14 different small apps in Swift.

### Articles

* [Learn Swift - No Frills Introduction](http://learn-swift.co) - My favorite Swift cheatsheet - straightforward and easy to read.

* [Learn Swift from Objective-C](http://codewithchris.com/learn-swift-from-objective-c/) - A series of tutorials with side-by-side examples of Objective-C code and Swift code.

* [Swift Optionals Made Simple](http://appventure.me/2014/06/13/swift-optionals-made-simple/) - The issue with teaching about optionals is that they are difficult to explain. This article does a good job of explaining optionals in a simple fashion.

* [A Beginner's Guide to Optionals in Swift](http://www.appcoda.com/beginners-guide-optionals-swift/) - Optionals are one of the most important and often confusing aspects of Swift. I recommend reading many of these introductory articles until the information sinks in.

* [Swift Initialization and the Pain of Optionals](http://www.scottlogic.com/blog/2014/11/20/swift-initialisation.html) - Swift doesn't permit nil references which creates often confusing issues - specifically with initializing objects. This article explores some options for dealing with these issues.

* [Enums instead of Booleans](http://www.objc.io/snippets/12.html) - There are times when you would normally use booleans to  represent data when an Enum would actually be more effective. This article explains.

* [Type-safe URL routes in Swift](http://chris.eidhof.nl/posts/typesafe-url-routes-in-swift.html) - We typically use strings to describe endpoints when working with APIs - this article describes a clever approach for creating strongly typed URL routes.

* [Efficient JSON in Swift with Functional Concepts and Generics](http://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics) - We touched on why handling JSON in Swift can be a nightmare but resorted to using SwiftyJSON to handle it for us. When you're ready to write your own JSON handler this is a good place to start.

* [Real World JSON Parsing with Swift](http://robots.thoughtbot.com/real-world-json-parsing-with-swift) - An expansion on the article above to incorporate handling nil values.

* [Optionals? If We Must](http://nomothetis.svbtle.com/optionals-if-we-must) - I think optionals become much easier to grip when you start to understand the point is to avoid using them as much as possible.

* [Understanding Optional Chaining](http://nomothetis.svbtle.com/understanding-optional-chaining) - A more in depth look at optional chaining.

* [Tearing Down Swift's Optional Pyramid of Doom](http://www.scottlogic.com/blog/2014/12/08/swift-optional-pyramids-of-doom.html) - this article describes some techniques for dealing with the optional if-let pyramid you'll likely encounter when dealing with many optionals.

* [Error Handling in Swift: Might and Magic](http://nomothetis.svbtle.com/error-handling-in-swift) - This article describes a very clean (and very awesome if you're coming from Obj-C) way of performing error handling in Swift.

* [Nice Web Services, Swift Edition](http://commandshift.co.uk/blog/2014/12/28/nice-web-services-swift-edition/) - This article describes a great way to handle API data after its been parsed. A lot of the TMDB code in the workshop is based on this article.

* [Secret of Swift Performance](https://medium.com/swift-programming/secret-of-swift-performance-a8ee86060843) - A brief article about how to identify performance bottlenecks in your Swift code.

* [Swift: Using Complex Enums to Improve TableViews](http://natashatherobot.com/swift-enums-tableviews/) - I really love how powerful enums are in Swift. This article should open up your mind to some of the possibilities.

* [Swift Failable Initializers](http://www.jessesquires.com/swift-failable-initializers/) - Swift's code safety features are only useful if we take advantage of them. Too frequently we resort to using variables and optionals when we don't actually need to. Failable initializers can be useful for only producing objects we know are a certain way.

* [Nil Coalescing in Swift](http://www.codingexplorer.com/nil-coalescing-swift/) - How often do you find yourself wanting to unwrap an optional and provide a different value instead if its nil? Nil coalescing provides a concise means of doing so.

* [Swift Closures and Funtions](http://fuckingswiftblocksyntax.com) - A great reference for the often difficult-to-remember syntax of closures in Swift (though its way better than blocks in Obj-C)

* [Welcome!...and Generics](http://swiftyeti.com/generics/) - Generics are a more advanced topic that we only briefly touched on in the workshop, but they are very powerful and should not be ignored.

### Tools/References

* [Swift Toolbox](http://www.swifttoolbox.io) - A community catalog of libraries written in Swift.

* [Carthage](https://github.com/Carthage/Carthage) - Carthage is a less intrusive alternative to Cocoapods that is gaining popularity.

* [CocoaPods Frameworks](http://blog.cocoapods.org/Pod-Authors-Guide-to-CocoaPods-Frameworks/) - A Cocoapods blog post describing the introduction of Frameworks and Swift (beta available).