//
//  KeychainProtocol.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 30/04/2023.
//

import Foundation

protocol KeychainProtocol{
    func saveStringValueIntoKeyChain(value:String,forkey:String)
    func getStringValueFromKeyChain(forKey:String) -> String?
}
