// UserInterfaceStyleController
// Created by Rashid Latif on 20/07/2022.
// Email:- rashid.latif93@gmail.com
// https://stackoverflow.com/users/10383865/rashid-latif
// https://github.com/rashidlatif55

import UIKit

enum UserInterfaceStyleType: String {
    case system = "System Default"
    case dark = "Dark"
    case light = "Light"
   
    var getIndex:Int{
        switch self {
        case .system:
            return 0
        case .dark:
            return 1
        case .light:
            return 2
        }
    }
    
   static func setIndex(index:Int)-> UserInterfaceStyleType{
        switch index {
        case 0: return .system
            
        case 1: return .dark
            
        case 2: return .light
            
        default: return .system
        }
    }
    
}

@available(iOS 13.0, *)
final class UserInterfaceStyle {
    static func changeStyle(style:UserInterfaceStyleType, animate:Bool = true){
        var tempStyle: UIUserInterfaceStyle = .unspecified
        switch style {
        case .system:
            tempStyle = .unspecified
        case .light:
            tempStyle = .light
        case .dark:
            tempStyle = .dark
        }
        
        //Save in UserDefaults
        UserDefaults.standard.setUserInterfaceStyle(value: style.rawValue)
        
        //Change with animation
        let duration = animate ? 0.35 : 0.0
        UIView.animate(withDuration: duration) {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle  = tempStyle
        }
    }
}

extension UserDefaults{
    //MARK: Save User prefered interface style
    func setUserInterfaceStyle(value: String){
        set(value, forKey: "UserInterfaceStyleType")
    }
    
    //MARK: Retrieve User prefered interface style
    func getUserInterfaceStyle() -> UserInterfaceStyleType{
        let style = UserDefaults.standard.value(forKey: "UserInterfaceStyleType") as? String ?? ""
        switch style {
        case UserInterfaceStyleType.system.rawValue:
            return .system
        case UserInterfaceStyleType.dark.rawValue:
            return .dark
        case UserInterfaceStyleType.light.rawValue:
            return .light
        default: return .system
        }
    }
    
     //MARK: remove User prefered interface style
    func removeUserInterfaceStyle(){
        self.removeObject(forKey: "UserInterfaceStyleType")
    }
    
}
