# OnlineShoppingApp
### Simple Swift App for new learner

## Naming
Naming standard: ![](https://github.com/microsoft/swift-guide/blob/gh-pages/Naming.md)

- If a file contains extensions, then the file name should be MyType+Extensions.swift unless the extension is purely adopting a protocol; in that case the extension should be named MyType+ProtocolBeingConformedTo.swift, for example MyDictionary+NSCopying.swift
- For booleans, use prefixes such as is and has make it clear that a variable is a boolean.

## hardcode

- Hardcoding values directly in source code is generally not a good practice. Instead, it's recommended to centralize these values so that they can be easily reused and updated. 

*For example*:


#### Using UIColor Extension:
- Pros:
Swifty: This approach feels very natural in Swift. It extends UIColor to include your app-specific colors, so accessing them feels like accessing any other built-in color.
Concise: When you want a color, it’s straightforward: UIColor.appBackground. It's clear that you're dealing with a color.
Encapsulation: All color-related logic and constants are within the UIColor scope.
- Cons:
Pollution: If you have a large number of custom colors, extending UIColor can make the UIColor namespace crowded.
Less Flexibility: If you later decide to add other types of constants (not just colors), you'll likely have to use another approach for those.

#### Using App Constants Structure:
- Pros:
Organization: You can keep all constants, not just colors, in a centralized place. This could include fonts, animation durations, keys, etc.
Expansion: If your app grows to include themes or multiple color schemes, a separate structure can make handling this easier.
- Cons:
Verbosity: It can be a bit more verbose: AppConstants.Colors.backgroundColor.
Indirection: New developers might have to look up where AppConstants is defined to understand its structure and contents.


### Reusable
The <T: UIViewController> in func createCustomViewController<T: UIViewController> represents Swift's generic syntax. Generics allow code to be independent of specific types. Here, T is a type placeholder. The constraint T: UIViewController means T must be a type of UIViewController or its subclass. This design lets the function createCustomViewController be flexible, capable of creating instances for any UIViewController subclass. Using generics, one can handle multiple UIViewController subclasses with a single function, eliminating the need for separate functions for each subclass.

```
    func createViewController<T: UIViewController>(ofType: T.Type, image: UIImage?, selectedImage: UIImage?, title: String) -> T {
        let vc = T() //或者其他特定的VC
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        vc.tabBarItem.title = title
        return vc
    }
```

### protocols
#### You need to add weak if you want to use protocol object and don't forget add Anyobject for this protocol so that it becomes a class type.


