//
//  HomeServices.swift
//  TestUnit
//
//  Created by Mac on 18.12.2022.
//

import Foundation

protocol HomeService {
    func loadHomePage(completion: @escaping (Result<Home, Error>) -> Void)
}

final class HomeServiceImpl: HomeService {

    private enum URLS {
        static let home = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    }

    private let networkService: Networking

    init(networkService: Networking) {
        self.networkService = networkService
    }

    func loadHomePage(completion: @escaping (Result<Home, Error>) -> Void) {
        networkService.request(url: URLS.home, completion: completion)
    }

}
