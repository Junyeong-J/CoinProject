//
//  HorizonTalSectionView.swift
//  CoinProject
//
//  Created by 전준영 on 9/8/24.
//

import SwiftUI

struct HorizonSectionView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { item in
                    SectionDetailView()
                }
            }
        }
    }
}

#Preview {
    HorizonSectionView()
}
