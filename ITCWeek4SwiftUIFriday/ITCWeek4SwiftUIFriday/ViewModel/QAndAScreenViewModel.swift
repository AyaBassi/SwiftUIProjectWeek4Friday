//
//  QAndAScreenViewModel.swift
//  ITCWeek4SwiftUIFriday
//
//  Created by Payam Karbassi on 07/05/2023.
//

import UIKit

class QAndAScreenViewModel: ObservableObject {
    @Published var questions : [String] = []
    @Published var answers : [String] = []
}
