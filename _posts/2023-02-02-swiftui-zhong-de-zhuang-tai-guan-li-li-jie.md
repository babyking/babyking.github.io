---
typora-root-url: ../
typora-copy-images-to: ../image
layout: post
title: Swiftui中的状态管理理解
date: 2023-02-02 17:02
category: 技术
tags: [swiftui]
---



总结更新:

1. @State是针对一个View的简单数据存储且私有. 一个View的多个实例都有自己的 @State
2. @StateObject是针对一个View的复杂数据存储,一个View的多个实例共享一个@StateObject
3. @ObservedObjec是对一个View的复杂数据存储,一个View的多个实例有多个@ObservedObject
4. @StateObject、@ObservedObject 实现ObservableObject协议,通过@Pblished来声明被观察对象
5. @Binding 不光可以接受@State的对象,也可以接受@StateObject和@ObservedObject对象中的成员数据.

```swift
class Settings: ObservableObject {
    @Published var fontSize: Int = 17
}

struct ContentView: View {
    @ObservedObject var settings = Settings()

    var body: some View {
        Text("Hello, World!")
            .font(.system(size: CGFloat(settings.fontSize)))
            .padding()
    }
}

struct SettingsView: View {
    @Binding var fontSize: Int

    var body: some View {
        VStack {
            Text("Font Size")
            Stepper("Size", value: $fontSize, in: 10...50)
        }
    }
}

```

6. 



以下的很多理解是看了[@StateObject 和 @ObservedObject 的区别和使用](https://onevcat.com/2020/06/stateobject/)跟chatGPT聊完得出的,谢谢chatGPT



1. ~~@State 和@Binding 是一对,@StateObject 和 @ObservedObject 是一对. (可能不对?) .****~~

2. 在View中声明并创建实例@ObservedObject ,那么View多次创建则其@ObservedObject 也会多次创建,如果多个View需要共享一个数据状态,则需要声明 @StateObject来替代 @ObservedObject .  **@StateObject更像是状态单例描述符**

   **要进行传递或者注入，其实无论如何还是涉及外界了。大部分情况下，选择 `@Binding` 和 `@ObservedObject` 会更正确**

3. @Binding 声明时不可以直接在声明时赋值,

4. @StateObject,@EnvironmentObject 都要实现 **ObservableObject**协议

5. 没有 **@ObservableObject** 这种写法

6. `@ObservedObject` 不管存储，会随着 `View` 的创建被多次创建。而 `@StateObject` 保证对象只会被创建一次。因此，如果是在 `View` 里自行创建的 `ObservableObject` model 对象，大概率来说使用 `@StateObject` 会是更正确的选择。`@StateObject` 基本上来说就是一个针对 class 的 `@State` 升级版。

   





> 转https://onevcat.com/2020/06/stateobject/
>
> `@ObservedObject` 不管存储，会随着 `View` 的创建被多次创建。而 `@StateObject` 保证对象只会被创建一次。因此，如果是在 `View` 里自行创建的 `ObservableObject` model 对象，大概率来说使用 `@StateObject` 会是更正确的选择。`@StateObject` 基本上来说就是一个针对 class 的 `@State` 升级版。
>
> 如果你对详细内容感兴趣，想知道整个故事的始末，可以继续阅读。
>
> ### 初版 SwiftUI 的状态管理
>
> 在 2019 年 SwiftUI 刚问世时，除去专门用来管理手势的 `@GestureState` 以外，有三个常用的和状态管理相关的 property wrapper，它们分别是 `@State`，`@ObservedObject` 和 `@EnvironmentObject`。根据职责和作用范围不同，它们各自的适用场景也有区别。一般来说：
>
> - `@State` 用于 `View` 中的私有状态值，一般来说它所修饰的都应该是 struct 值，并且不应该被其他的 view 看到。它代表了 SwiftUI 中作用范围最小，本身也最简单的状态，比如一个 `Bool`，一个 `Int` 或者一个 `String`。简单说，如果一个状态能够被标记为 `private` 并且它是值类型，那么 `@State` 是适合的。
> - 对于更复杂的一组状态，我们可以将它组织在一个 class 中，并让其实现 `ObservableObject` 协议。对于这样的 class 类型，其中被标记为 `@Published` 的属性，将会在变更时自动发出事件，通知对它有依赖的 `View` 进行更新。`View` 中如果需要依赖这样的 `ObservableObject` 对象，在声明时则使用 `@ObservedObject` 来订阅。
> - `@EnvironmentObject` 针对那些需要传递到深层次的子 `View` 中的 `ObservableObject` 对象，我们可以在父层级的 `View` 上用 `.environmentObject` 修饰器来将它注入到环境中，这样任意子 `View` 都可以通过 `@EnvironmentObject` 来获取对应的对象。
>
> 这基本就是初版 SwiftUI 状态管理的全部了。



#### 下面是聊天内容

![image-20230202171927787](/image/image-20230202171927787.png)

![image-20230202171943490](/image/image-20230202171943490.png)

![image-20230202172004335](/image/image-20230202172004335.png)

![image-20230202172046483](/image/image-20230202172046483.png)

![image-20230202172059405](/image/image-20230202172059405.png)

![image-20230202172115365](/image/image-20230202172115365.png)

![image-20230202172139012](/image/image-20230202172139012.png)

![image-20230202172151276](/image/image-20230202172151276.png)

![image-20230202172200141](/image/image-20230202172200141.png)

