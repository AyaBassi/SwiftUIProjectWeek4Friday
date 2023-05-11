//
//  SignUpViewModel.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 22/04/2023.
//

import Foundation
class SignUpViewModel {
    
    
    func isValidSigningIn(email:String?,password:String?,repeatPassword:String?)->Bool{
        var isValid = false
        
        guard let email = email else {return isValid}
        guard let password = password else { return isValid}
        guard let repeatPassword = repeatPassword else { return isValid}
        
        // checking for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        // checking for password validation
        let isValidPassword = password.count >= 6
        
        // checking both passwords match
        var isValidRepeatPassword = false
        password == repeatPassword ? isValidRepeatPassword = true : print("Password don't match")
        
        // making sure they are both valid
        isValid = isEmailValid && isValidPassword && isValidRepeatPassword
        
        return isValid
    }
    
    func saveToKeychain(password:String, withEmailAsKey email:String, aKeyChainManager: KeychainProtocol){
        do{
            try aKeyChainManager.saveStringValueIntoKeyChain(value: password, forkey: email)
        }catch let error {
            print("error:\(error.localizedDescription)")
        }
    }
    
}
