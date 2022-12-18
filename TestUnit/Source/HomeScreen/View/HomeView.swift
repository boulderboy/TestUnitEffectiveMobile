//
//  HomeView.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showFilters: Bool = false
    @StateObject private var vm: HomeViewModel = {
        let networkService = NetworkService()
        let homeService = HomeServiceImpl(networkService: networkService)

        return HomeViewModel(service: homeService)
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.mainBackgroundColor
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Header(showFilters: $showFilters)
                        CategoriesSection()
                        SearchView()
                            .padding(.bottom, 24)
                        HotSalesSection(hotSales: $vm.home.homeStore)
                        BestSellerSectionView(cards: $vm.home.bestSeller)
                    }
                }
                .padding(.horizontal, 17)
                .sheet(isPresented: $showFilters) {
                    NavigationStack{
                        FilterView()
                    }
                    .presentationDetents([.height(414)])
                    .presentationDragIndicator(.hidden)
                }
            }
        }
    }
    
    private struct Header: View {
        
        @Binding var showFilters: Bool
        
        var body: some View {
            HStack {
                Spacer()
                Image(systemName: "mappin.circle")
                    .foregroundColor(Color.mainOrange)
                Text("Tbilisi, Geo")
                    .font(.system(size: 15))
                Image(systemName: "chevron.down")
                Spacer()
                Button {
                    showFilters.toggle()
                } label: {
                    Image("filter")
                        .resizable()
                }
                .frame(width: 11, height: 13)
            }
            .padding(.horizontal, 35)
        }
    }
}
