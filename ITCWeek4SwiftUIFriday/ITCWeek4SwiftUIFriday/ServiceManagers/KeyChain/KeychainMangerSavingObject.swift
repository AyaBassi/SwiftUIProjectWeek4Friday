//
//  KeychainMangerSavingObject.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 11/05/2023.
//

import Foundation
class KeychainMangerSavingObject {
    func getStringValueFromKeyChain<T>(forKey: String) -> T? where T : Decodable {
        let dataDict : [String:Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String : forKey,
            kSecAttrService as String: "com.ITC.ITCWeek4SwiftUIFriday",
            kSecReturnData as String:kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status : OSStatus = SecItemCopyMatching(dataDict as CFDictionary, &result)
        
        if status == noErr , let data = result as? Data{
            do {
                let data = try JSONDecoder().decode(T.self , from: data)
                return data
            }catch {
                print("error:\(error)")
            }
        }else {
            return nil
        }
        return nil
    }
    

    func saveStringValueIntoKeyChain<T>(value: T, forkey: String) throws{
        guard let objectVal = value as? Encodable else {print("Modle does not conform to encodable");return}
        
        do {
            let data = try JSONEncoder().encode(objectVal)
            let serviceName = Bundle.main.bundleIdentifier ?? "com.ITC.ITCWeek4SwiftUIFriday"
            
            let dataDict : [String: Any] = [
                kSecClass as String : kSecClassGenericPassword,
                kSecAttrService as String : serviceName,
                kSecAttrAccount as String: forkey,
                kSecValueData as String: data
            ]
            let status = SecItemAdd(dataDict as CFDictionary, nil)
            if status == noErr {
                print("saved to keychain")
            }else {
                print("not working")
            }
        }catch let error {
            throw error
        }
    }
}
