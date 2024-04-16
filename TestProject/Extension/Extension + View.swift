//
//  Extension.swift
//  TestProject
//
//  Created by 1 on 16.04.2024.
//

import SwiftUI

extension View {
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
