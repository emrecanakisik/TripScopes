import UIKit

struct Colors{
    static let dark = "#0F0F12"
    static let darkGray = "#1A1A1E"
    static let gray = "#4d4d59"
    static let lightGray = ""
    
    static let white = "#FFFFFF"
    static let black = "#000000"
    
    // Primary
    static let primary = "#007AFF"
    static let primary100 = "#EDF0FF"
    static let primary200 = "#D8E2FF"
    static let primary300 = "#ADC6FF"
    static let primary400 = "#80ABFF"
    static let primary500 = "#4B8EFF"
    static let primary600 = "#0072F0"
    static let primary700 = "#005BC1"
    static let primary800 = "#004493"
    static let primary900 = "#002E69"
    static let primary1000 = "#001A41"
        
    // Secondary
    static let secondary = "#FF5A00"
    static let secondary100 = "#FFEDE7"
    static let secondary200 = "#FFDBCF"
    static let secondary300 = "#FFB59A"
    static let secondary400 = "#FF8C5F"
    static let secondary500 = "#FD5900"
    static let secondary600 = "#D24900"
    static let secondary700 = "#A83900"
    static let secondary800 = "#802900"
    static let secondary900 = "#5B1B00"
    static let secondary1000 = "#380D00"
        
    // Tertiary
    static let tertiary = "#1D1D1F"
    static let tertiary100 = "#F3F0F2"
    static let tertiary200 = "#E4E2E4"
    static let tertiary300 = "#C8C6C8"
    static let tertiary400 = "#ACAAAD"
    static let tertiary500 = "#929092"
    static let tertiary600 = "#787679"
    static let tertiary700 = "#5F5E60"
    static let tertiary800 = "#474649"
    static let tertiary900 = "#303032"
    static let tertiary1000 = "#1B1B1D"
        
    // Neutral
    static let neutral = "#F5F5F7"
    static let neutral100 = "#F0F0F2"
    static let neutral200 = "#E2E2E4"
    static let neutral300 = "#C6C6C8"
    static let neutral400 = "#AAABAD"
    static let neutral500 = "#909193"
    static let neutral600 = "#767779"
    static let neutral700 = "#5D5E60"
    static let neutral800 = "#454749"
    static let neutral900 = "#2F3132"
    static let neutral1000 = "#1A1C1D"
}
extension UIColor {
   convenience init(hex: String) {
       var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
       hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

       var rgb: UInt64 = 0

       var r: CGFloat = 0.0
       var g: CGFloat = 0.0
       var b: CGFloat = 0.0
       var a: CGFloat = 1.0

       let length = hexSanitized.count

       guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
           self.init(red: 0, green: 0, blue: 0, alpha: 1)
           return
       }

       if length == 6 {
           r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
           g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
           b = CGFloat(rgb & 0x0000FF) / 255.0

       } else if length == 8 {
           r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
           g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
           b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
           a = CGFloat(rgb & 0x000000FF) / 255.0
       }

       self.init(red: r, green: g, blue: b, alpha: a)
   }
}
