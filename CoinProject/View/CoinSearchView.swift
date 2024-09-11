//
//  CoinSearchView.swift
//  CoinProject
//
//  Created by 전준영 on 9/8/24.
//

import SwiftUI

struct CoinSearchView: View {
    
    @State private var searchText = ""
    @State private var coinList: [Coin] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                listView()
            }
            .navigationTitle("Search")
        }
        .task {
            CoinAPI.fetchSearchCoin(completion: { value in
                coinList = value.coins
                })
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "search")
    }
    
    private func listView() -> some View {
        LazyVStack{
            ForEach(coinList, id: \.self){ data in
                rowView(data)
            }
        }
    }
    
    private func rowView(_ data: Coin) -> some View {
        HStack{
            if let thumbURL = URL(string: data.thumb) {
                AsyncImage(url: thumbURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
            }
            VStack(alignment: .leading) {
                Text(data.name)
                Text(data.symbol)
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
