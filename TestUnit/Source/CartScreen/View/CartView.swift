//
//  CartView.swift
//  TestUnit
//
//  Created by Mac on 13.12.2022.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject private var vm: CartViewModel = {
        let networkService = NetworkService()
        let cartService = CartServiceImpl(networkService: networkService)
        return CartViewModel(service: cartService)
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.darkViolet
                    .cornerRadius(30)
                ScrollView {
                    VStack {
                        ForEach(vm.cart.basket) { item in
                            CartItemView(
                                title: item.title,
                                price: item.price,
                                imageUrl: item.images
                            )
                        }
                        Spacer()
                        VStack {
                            Color.greyForCategory
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .padding(.bottom, 18)
                            TotalView(totalPrice: vm.cart.total, deliveryPrice: vm.cart.delivery)
                                .padding(.horizontal)
                            Color.greyForCategory
                                .frame(maxWidth: .infinity, maxHeight: 2)
                                .padding(.top, 18)
                        }
                        CheckoutButton()
                            .padding(.vertical, 44)
                    }
                    .padding(.top, 80)
                    .padding(.horizontal, 25)
                }
            }
            .padding(.top, 180)
            .ignoresSafeArea()
            .navigationTitle("My cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .background(
                                Color.darkViolet
                                    .frame(width: 37, height: 37)
                                    .cornerRadius(10)
                            )
                    }
                    .padding(.leading)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Text("Add address")
                            .font(.system(size: 15))
                            .fontWeight(.thin)
                        Image(systemName: "mappin.circle")
                            .frame(width: 37, height: 37)
                            .background(Color.mainOrange.cornerRadius(10))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}
