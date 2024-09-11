//
//  TopCoinSectionView.swift
//  CoinProject
//
//  Created by 전준영 on 9/11/24.
//

import SwiftUI

struct TopCoinSectionView: View {
    
    @State private var topCoins: [CoinItem] = []
    
    let rows = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(Array(topCoins.enumerated()), id: \.element) { index, coinItem in
                        CoinRowView(coin: coinItem.item, rank: index + 1)
                            .frame(width: 300)
                    }
                }
                .padding()
            }
            .task {
                CoinAPI.fetchTopCoin { response in
                    if let response = response {
                        topCoins = response.coins
                    }
                }
            }
        }
    }
}

struct CoinRowView: View {
    let coin: TopCoin
    let rank: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(rank)")
                    .font(.title3)
                    .bold()
                    .frame(width: 30)
                
                AsyncImage(url: URL(string: coin.thumb)) { image in
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading) {
                    Text(coin.name)
                        .font(.headline)
                    Text(coin.symbol)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    if let price = coin.data?.price {
                        Text("$\(price, specifier: "%.2f")")
                            .font(.headline)
                    }
                    if let change = coin.data?.priceChangePercentage24H?["usd"] {
                        Text("\(change, specifier: "%.2f")%")
                            .font(.subheadline)
                            .foregroundColor(change >= 0 ? .red : .blue)
                    }
                }
            }
            Divider()
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    TopCoinSectionView()
}
