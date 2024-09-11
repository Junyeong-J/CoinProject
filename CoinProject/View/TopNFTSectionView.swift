//
//  TopNFTSectionView.swift
//  CoinProject
//
//  Created by 전준영 on 9/11/24.
//

import SwiftUI

struct TopNFTSectionView: View {
    
    @State private var topNFTs: [NftItem] = []
    
    let rows = [GridItem(.fixed(100)), GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(Array(topNFTs.enumerated()), id: \.element) { index, nftItem in
                        NftRowView(nft: nftItem, rank: index + 1)
                            .frame(width: 300)
                    }
                }
                .padding()
            }
            .task {
                CoinAPI.fetchTopCoin { response in
                    if let response = response {
                        topNFTs = response.nfts
                    }
                }
                
            }
        }
    }
    
    struct NftRowView: View {
        let nft: NftItem
        let rank: Int
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text("\(rank)")
                        .font(.title3)
                        .bold()
                        .frame(width: 30)
                    
                    AsyncImage(url: URL(string: nft.thumb)) { image in
                        image
                            .resizable()
                            .frame(width: 40, height: 40)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(nft.name)
                            .font(.headline)
                        Text(nft.symbol)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("\(nft.floorPriceInNativeCurrency, specifier: "%.2f") \(nft.nativeCurrencySymbol.uppercased())")
                            .font(.headline)
                        Text("\(nft.floorPrice24hPercentageChange, specifier: "%.2f")%")
                            .font(.subheadline)
                            .foregroundColor(nft.floorPrice24hPercentageChange >= 0 ? .green : .red)
                    }
                }
                Divider()
            }
            .padding(.vertical, 8)
        }
    }
}



#Preview {
    TopNFTSectionView()
}
