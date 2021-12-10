//
//  UserSevice.swift
//  NADA-iOS-forRelease
//
//  Created by kimhyungyu on 2021/11/01.
//

import Foundation
import Moya

enum UserSevice {
    case userIDFetch(userID: String)
    case userTokenFetch(userID: String)
    case userSignUp(request: User)
    case userDelete(userID: String)
    case userSocialSignUp(request: User)
}

extension UserSevice: TargetType {
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }

    var path: String {
        switch self {
        case .userIDFetch(let userID):
            return "/\(userID)/login"
        case .userTokenFetch(let userID):
            return "/auth/\(userID)/login"
        case .userSignUp:
            return "/register"
        case .userDelete(let userID):
            return "/\(userID)"
        case .userSocialSignUp:
            return "auth/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .userIDFetch, .userTokenFetch:
            return .get
        case .userSignUp, .userSocialSignUp:
            return .post
        case .userDelete:
            return .delete
        }
    }

    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .userIDFetch, .userTokenFetch, .userDelete:
            return .requestPlain
        case .userSignUp(let request):
            return .requestJSONEncodable(request)
        case .userSocialSignUp(let request):
            return .requestJSONEncodable(request)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .userIDFetch, .userTokenFetch, .userDelete:
            return .none
        case .userSignUp, .userSocialSignUp:
            return ["Content-Type": "application/json"]
        }
    }
}
