//
//  GeneralAPI.swift
//  NADA-iOS-forRelease
//
//  Created by kimhyungyu on 2021/11/01.
//

import Foundation

extension Const {
    struct URL {
        #if DEBUG
        static let baseURL = "http://3.35.107.3:8080/api"
        #else
        static let baseURL = "http://3.35.107.3/api"
        #endif
        
        static let policyURL = "https://nadaitzme.notion.site/NADA-8385054bc2e44762a62f590534b2a24d"
        static let serviceURL =  "https://nadaitzme.notion.site/NADA-58544bc9f0a1493c94f223cab3a440d0"
        static let moyaURL = "https://github.com/Moya/Moya"
        static let skeletonURL = "https://github.com/Juanpe/SkeletonView"
        static let swiftLintURL = "https://github.com/realm/SwiftLint"
        static let cardSwiperURL = "https://github.com/JoniVR/VerticalCardSwiper"
        static let kakaoURL = "https://developers.kakao.com/sdk/reference/ios/release/KakaoSDKCommon/index.html"
        static let keyboardURL = "https://github.com/hackiftekhar/IQKeyboardManager"
        static let kingfisherURL = "https://github.com/onevcat/Kingfisher"
        static let indicatorURL = "https://github.com/ninjaprox/NVActivityIndicatorView"
        static let lottieURL = "https://github.com/airbnb/lottie-ios"
        static let thenURL = "https://github.com/devxoul/Then"
        static let snapKitURL = "https://github.com/SnapKit/SnapKit"
        static let rxSwiftURL = "https://github.com/ReactiveX/RxSwift"
        static let flexLayoutURL = "https://github.com/layoutBox/FlexLayout"
        static let pinLayoutURL = "https://github.com/layoutBox/PinLayout"
        static let rxGestureURL = "https://github.com/RxSwiftCommunity/RxGesture"
        static let ypImagePickerURL = "https://github.com/Yummypets/YPImagePicker"
        static let firebaseURL = "https://github.com/firebase/firebase-ios-sdk"
        static let dynamicLinkURLPrefix = "https://itzmenada.page.link"
        static let opendDynamicLinkOnWebURL = "https://instagram.com/nada.haseyo"
    }
}
