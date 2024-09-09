//
//  CoinDetailView.swift
//  CoinProject
//
//  Created by 전준영 on 9/10/24.
//

import SwiftUI

struct CoinDetailView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("$69,000,000")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                    
                    Text("+3.22% Today")
                        .padding(.horizontal)
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("고가")
                        Text("$69,000,000")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("저가")
                        Text("$67,500,000")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("시가")
                        Text("$68,000,000")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("종가")
                        Text("$68,500,000")
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Solana")
        }
        
    }
}

#Preview {
    CoinDetailView()
}
