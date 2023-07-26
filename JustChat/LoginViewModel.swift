//
//  LoginViewModel.swift
//  JustChat
//
//  Created by Александра Кострова on 21.06.2023.
//

import Foundation
import UIKit.UIColor

class LoginViewModel {
    var statusText = Dynamic("")
    var statusColor = Dynamic(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    func loginButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].password {
            statusText.value = "Failed"
            statusColor.value = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        } else {
            statusText.value = "Success"
            statusColor.value = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
}
