//
//  HomeViewModel.swift
//  TestUnit
//
//  Created by Mac on 12.12.2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var home: Home = .empty

    private var service: HomeService
    
    init(service: HomeService) {
        self.service = service

        getInfoForHomePage { result in
            switch result {
            case .success(let home):
                DispatchQueue.main.async {
                    self.home = home
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getInfoForHomePage(completion: @escaping (Result<Home, Error>) -> Void) {
        service.loadHomePage(completion: completion)
    }
}
