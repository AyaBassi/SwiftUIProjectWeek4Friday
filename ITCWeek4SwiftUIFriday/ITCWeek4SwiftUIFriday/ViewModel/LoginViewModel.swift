//
//  LoginViewModel.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import UIKit
import LocalAuthentication

class LoginViewModel : ObservableObject{
    
    @Published var credentials = Credentials()
    @Published var authenticationError : AuthenticationError?
    
    func isValidLoggingIn(email:String?,password:String?)->Bool{
        var isValid = false
        guard let email = email else {return isValid}
        guard let password = password else { return isValid}
        
        // checking for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        // checking for password validation
        let isValidPassword = password.count >= 6
        
        // making sure they are both valid
        isValid = isEmailValid && isValidPassword
        return isValid
    }
    
    func isCorrectEmailAndPassword(email:String?,password:String?,aKeychainManager:KeychainProtocol)-> Bool{
        var passwordIsCorrect = false
        guard let email = email,
              let password = password else {
            return passwordIsCorrect
        }

        guard let returnedPassword = aKeychainManager.getStringValueFromKeyChain(forKey: email) else {
            return passwordIsCorrect
        }
        if returnedPassword == password { passwordIsCorrect = true }
        return passwordIsCorrect
    }
    
    func returningAvailableBiometricType ()-> BiometricAvailableType {
        let authContext = LAContext()
//        let _ = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        guard authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) else {return .none}
        switch authContext.biometryType {
        case .none:         return .none
        case .touchID:      return .touch
        case .faceID:       return .face
        @unknown default:   return .none
        }
    }
    
    func authenticateWithBiometric(completion:@escaping(Result< Bool ,AuthenticationError>)->Void){
        let authContext = LAContext()
        var error : NSError?
        let canEvaluate = authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if let error = error {
            switch error.code{
            case -6 : completion(.failure(.accessDenied))
                
            case -7:
                authContext.biometryType == .faceID ?
                completion(.failure(.noFaceId))
                :
                completion(.failure(.noTouchId))
            default:
                completion(.failure(.biomentricError))
            }
        }
        if canEvaluate {
            if authContext.biometryType != .none {
                authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Need to Access keychain") { success , error in
                    if error != nil {
                        completion(.failure(.biomentricError))
                    }else {
                        completion(.success(success))
                    }
                }
            }
        }
    }
    
}
