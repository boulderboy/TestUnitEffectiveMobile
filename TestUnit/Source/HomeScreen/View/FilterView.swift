//
//  FilterView.swift
//  TestUnitAgain
//
//  Created by Mac on 08.12.2022.
//

import SwiftUI

struct FilterView: View {
    
    @State private var isBrandExpanded: Bool = false
    @State private var isPriceExpanded: Bool = false
    @State private var sliderValue = 0.0
    @Environment(\.dismiss) var dismiss
    
    private let brands = ["Samsung", "Apple", "Huawei", "Xiaomi"]
    
    var body: some View {
        VStack {
            List {
                Section("Brand") {
                    DisclosureGroup(isExpanded: $isBrandExpanded) {
                        ForEach(brands.self, id: \.self) { brand in
                            HStack {
                                Image(systemName: "square")
                                Text(brand)
                            }
                        }
                    } label: {
                        Button {
                            
                        } label: {
                            HStack{
                                Text("Samsung")
                                Spacer()
                                Image(systemName: isBrandExpanded ? "chevron.down" : "chevron.left")
                            }
                        }.frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke()
                            )
                        
                        
                    }
                    .buttonStyle(PlainButtonStyle()).accentColor(.clear).disabled(true)
                }
                .listRowSeparator(.hidden)
                .font(.title3)
                .foregroundColor(.black)
                
                Section("Price") {
                    DisclosureGroup(isExpanded: $isPriceExpanded) {
                    } label: {
                        Button {
                            
                        } label: {
                            HStack{
                                Text("$300 - $500")
                                Spacer()
                                Image(systemName: isPriceExpanded ? "chevron.down" : "chevron.left")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke()
                        )
                    }
                    .buttonStyle(PlainButtonStyle()).accentColor(.clear).disabled(true)
                }
                .listRowSeparator(.hidden)
                .font(.title3)
                .foregroundColor(.black)
                
                Section("Size") {
                    DisclosureGroup(isExpanded: $isPriceExpanded) {
                    } label: {
                        Button {
                            
                        } label: {
                            HStack{
                                Text("4.5 - 5.5 inches")
                                Spacer()
                                Image(systemName: isPriceExpanded ? "chevron.down" : "chevron.left")
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke()
                        )
                    }
                    .buttonStyle(PlainButtonStyle()).accentColor(.clear).disabled(true)
                }
                .listRowSeparator(.hidden)
                .font(.title3)
                .foregroundColor(.black)
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .background {
                                Color.black
                                    .frame(width: 37, height: 37)
                                    .cornerRadius(10)
                            }
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .padding(.vertical, 7)
                            .padding(.horizontal, 20)
                            .foregroundColor(.white)
                            .background {
                                Color.orange
                                    .cornerRadius(10)
                            }
                    }
                    .padding(.top, 20)
                }
                ToolbarItem(placement: .principal) {
                    Text("Filter options")
                        .padding(.top, 20)
                        .font(.system(size: 20))
                }
            }
        }
    }
}
