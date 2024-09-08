//
//  CoinSearchView.swift
//  CoinProject
//
//  Created by 전준영 on 9/8/24.
//

import SwiftUI

struct CoinSearchView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                listView()
            }
            .navigationTitle("Search")
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "search")
    }
    
    private func listView() -> some View {
        LazyVStack{
            ForEach(0..<10){ _ in
                rowView()
            }
        }
    }
    
    private func rowView() -> some View {
        HStack{
            RandColorHeartView()
            VStack(alignment: .leading) {
                Text("Bitcoin")
                Text("BTC")
            }
            Spacer()
            Image(systemName: "star")
            
        }
        .padding()
    }
    
}

#Preview {
    CoinSearchView()
}

private struct RandColorHeartView: View {
    
    var body: some View {
        Circle()
            .fill(Color.random())
            .overlay {
                Image(systemName: "heart")
            }
            .frame(width: 50, height: 50)
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}
