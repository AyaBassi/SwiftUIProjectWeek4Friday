//
//  KeychainManager.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 30/04/2023.
//

import Foundation
class KeychainManager: KeychainProtocol {
    
    func saveStringValueIntoKeyChain(value: String, forkey: String) {
        if let data = value.data(using: .utf8){
            let query :[String:Any] =
            [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String:forkey,
                kSecValueData as String : data
            ]
            SecItemAdd(query as CFDictionary, nil)
        }
    }
    
    
    func getStringValueFromKeyChain(forKey: String) -> String? {
        let query : [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: forKey,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String : kSecMatchLimitOne
        ]
        
        var dataTypeRef : AnyObject? = nil
        let status : OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == noErr {
            if let data = dataTypeRef as? Data,
                let value = String(data: data , encoding: .utf8){
                return value
            }
        }
        return nil
    }
}
