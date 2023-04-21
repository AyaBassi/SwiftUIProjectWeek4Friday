//
//  LoginViewModel.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import Foundation

class LoginViewModel {
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
}
