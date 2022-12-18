

import SwiftUI

extension Color {
    public static let mainBackgroundColor = Color(UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.00))
    public static let mainOrange = Color(UIColor(red: 1.00, green: 0.43, blue: 0.31, alpha: 1.00))
    public static let greyForCategory = Color(UIColor(red: 0.70, green: 0.70, blue: 0.76, alpha: 1.00))
    public static let darkViolet = Color(UIColor(red: 0.00, green: 0.00, blue: 0.21, alpha: 1.00))
    public static let stepperBackground = Color(UIColor(red: 0.16, green: 0.16, blue: 0.26, alpha: 1.00))
    
    init(hex: String) {
         let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
         var int: UInt64 = 0
         Scanner(string: hex).scanHexInt64(&int)
         let a, r, g, b: UInt64
         switch hex.count {
         case 3: // RGB (12-bit)
             (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
         case 6: // RGB (24-bit)
             (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
         case 8: // ARGB (32-bit)
             (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
         default:
             (a, r, g, b) = (1, 1, 1, 0)
         }
         self.init(
             .sRGB,
             red: Double(r) / 255,
             green: Double(g) / 255,
             blue:  Double(b) / 255,
             opacity: Double(a) / 255
         )
     }
}
