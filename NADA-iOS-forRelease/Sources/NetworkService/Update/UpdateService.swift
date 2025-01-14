//
//  UpdateService.swift
//  NADA-iOS-forRelease
//
//  Created by kimhyungyu on 2023/04/05.
//

import Foundation

import Moya

enum UpdateService {
    case updateUserInfoFetch
    case updateNoteFetch
    case checkUpdateNote(isChecked: Bool)
    case bannerFetch
}

extension UpdateService: TargetType {
    var baseURL: URL {
        return URL(string: Const.URL.baseURL)!
    }
    
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var path: String {
        switch self {
        case .updateUserInfoFetch:
            return "/v1/app/update"
        case .updateNoteFetch:
            return "/v1/app/update/note"
        case .checkUpdateNote:
             return "/v1/app/update/check"
        case .bannerFetch:
             return "/v1/banner/advertising"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .updateUserInfoFetch, .updateNoteFetch, .bannerFetch:
            return .get
        case .checkUpdateNote:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .updateUserInfoFetch, .updateNoteFetch, .bannerFetch:
            return .requestPlain
        case .checkUpdateNote(let isChecked):
            return .requestParameters(parameters: ["checkUpdateNote": isChecked],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .updateUserInfoFetch, .updateNoteFetch, .checkUpdateNote, .bannerFetch:
            return Const.Header.bearerHeader()
        }
    }
}
