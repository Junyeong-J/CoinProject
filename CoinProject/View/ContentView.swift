//
//  MainView.swift
//  CoinProject
//
//  Created by 전준영 on 9/8/24.
//

import SwiftUI

struct Sect: Codable {
    var id = UUID()
    var section: String
}

struct MainView: View {
    
    @State private var text: String = ""
    
    @State private var list: [Sect] = [
        Sect(section: "My Favorite")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($list, id: \.id) { $item in
                    makeSection($item)
                }
            }
            .padding(.top)
            .navigationTitle("Crypto Coin")
        }
    }
    
    func makeSection(_ section: Binding<Sect>) -> some View {
        VStack {
            Text(section.section.wrappedValue)
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizonSectionView()
        }
    }
    
}

#Preview {
    MainView()
}
