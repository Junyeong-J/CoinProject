//
//  SectionDetailView.swift
//  CoinProject
//
//  Created by 전준영 on 9/8/24.
//

import SwiftUI

struct SectionDetailView: View {
    
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
                .frame(width: 200, height: 150)
                .padding()
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star")
                    VStack(alignment: .leading) {
                        Text("Bitcoin")
                        Text("Btc")
                    }
                    .padding()
                }
                VStack(alignment: .leading) {
                    Text("69,345,525")
                    Text("+0.64%")
                }
                .padding([.leading, .bottom])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
        }
    }
}

#Preview {
    SectionDetailView()
}
