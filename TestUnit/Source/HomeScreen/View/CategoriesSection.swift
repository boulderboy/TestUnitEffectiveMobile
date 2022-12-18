//
//  CategoriesSection.swift
//  TestUnit
//
//  Created by Mac on 10.12.2022.
//

import SwiftUI

struct CategoryModel: Identifiable {
    var id: Int
    var title: String
}

struct CategoriesSection: View {

    private let categories = ["Phone", "Computer", "Health", "Books", "Other"]

    @State private var selectedCategory = 0
    @State private var categoryModels = [CategoryModel]()
    
    var body: some View {
        VStack(spacing: 0) {
            HomeSectionTitle(sectionName: "Select category")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(categoryModels) { category in
                        Category(category: category, selectedCategory: $selectedCategory)
                    }.padding(.horizontal, 11)
                        .padding(.vertical, 5)
                }
            }
            .padding(.vertical, 24)
            .onAppear {
                createCategories(categories: categories)
            }
        }
    }
    func createCategories(categories: [String]) {
        categoryModels = []
        for i in 0..<categories.count {
            categoryModels.append(CategoryModel(id: i, title: categories[i]))
        }
    }
}

private struct Category: View {

    let category: CategoryModel

    @Binding var selectedCategory: Int

    var body: some View {
        let isSelected = category.id == selectedCategory
        VStack{
            ZStack{
                Circle()
                    .fill(isSelected ? Color.orange : Color.white)
                    .frame(width: 71)
                    .shadow(radius: 3)
                Image(category.title.lowercased())
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(isSelected ? .white : .gray)
                    .frame(width: 18, height: 30)
                    .onTapGesture {
                        selectedCategory = category.id
                    }
            }
            Text("\(category.title)")
                .font(.system(size: 12))
        }
        
    }
}
