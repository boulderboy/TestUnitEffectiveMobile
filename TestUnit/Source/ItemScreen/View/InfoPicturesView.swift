//
//  InfoPicturesView.swift
//  TestUnit
//
//  Created by Mac on 11.12.2022.
//

import SwiftUI

struct InfoPicturesView: View {
    
    @Binding var item: Item
    @State var cells = [ParameterView]()

    private let parameters = ["cpu", "camera", "memorychip", "sd"]
    
    var body: some View {
        HStack {
            ForEach(cells) { cell in
                cell
                if !(cells.firstIndex(of: cell) == cells.count - 1) {
                    Spacer()
                }
            }
        }.onAppear {
            createCells()
        }
        .onChange(of: item, perform: { _ in
            createCells()
        })
    }
    
    private func createCells() {
        var result = [ParameterView]()

        for parameter in ["cpu", "camera", "memorychip", "sd"] {
            switch parameter {
            case "cpu":
                result.append(ParameterView(imageName: "cpu", parameterLabel: item.CPU))
            case "camera":
                result.append(ParameterView(imageName: "camera", parameterLabel: item.camera))
            case "memorychip":
                result.append(ParameterView(imageName: "memorychip", parameterLabel: item.ssd))
            case "sd":
                result.append(ParameterView(imageName: "sdcard", parameterLabel: item.sd))
            default:
                return
            }
        }

        cells = result
    }
}
