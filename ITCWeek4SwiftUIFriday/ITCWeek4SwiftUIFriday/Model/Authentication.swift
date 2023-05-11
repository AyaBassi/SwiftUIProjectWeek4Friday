//
//  Authentication.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 11/05/2023.
//

import Foundation

enum BiometricAvailableType{
    case none
    case face
    case touch
}

enum AuthenticationError {
    case noFaceId
    case noTouchId
    case invalidCredentials
    case accessDenied
    case biomentricError
}
extension AuthenticationError: LocalizedError, Identifiable {
    var id : String {
        self.localizedDescription
    }
    var errorDescription: String? {
        switch self {
        case .noFaceId:
            return NSLocalizedString("noFaceId has been setup", comment: "noFaceId")
        case .noTouchId:
            return NSLocalizedString("noTouchId been setup", comment: "noTouchId")
        case .invalidCredentials:
            return NSLocalizedString("invalidCredentials", comment: "invalidCredentials")
        case .accessDenied:
            return NSLocalizedString("accessDenied", comment: "acceddDenied")
        case .biomentricError:
            return NSLocalizedString("biomentricError", comment: "bimentricError")
        }
    }
}
