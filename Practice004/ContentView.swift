//
//  ContentView.swift
//  Practice004
//
//  Created by npc on 2023/06/15.
//

import SwiftUI

extension Font {
    enum FontSize {
        case extraLarge
        case large
        case middle
        case small
        case extraSmall
        
        var size: CGFloat {
            switch self {
            case .extraLarge:
                return 25
            case .large:
                return 20
            case .middle:
                return 15
            case .small:
                return 12
            case .extraSmall:
                return 10
            }
        }
    }
    static func mplus(weight: Font.Weight, size: FontSize) -> Font{
        
        let fontName: String
        switch weight {
        case .black :
            fontName = "Mplus2-Black"
        case .bold, .heavy:
            fontName = "Mplus2-Bold"
        default:
            fontName = "Mplus2-Regular"
        }
        
        return .custom(fontName, size: size.size)
        
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            AvocadoBurger()
                .tabItem {
                    Image(systemName: "fork.knife")
                    Text("練習課題")
                }
            SampleBurger()
                .tabItem {
                    Image(systemName: "graduationcap.fill")
                    Text("サンプル")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
