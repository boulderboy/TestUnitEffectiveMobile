//
//  NetworkService.swift
//  TestUnit
//
//  Created by Mac on 18.12.2022.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(url: String, completion: @escaping (Result<T, Error>) -> Void)
    func requestData(url: String, completion: @escaping (Result<Data?, Error>) -> Void)
}

final class NetworkService: Networking {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T>(url: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                guard let data = data else { return }

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase

                let result = try decoder.decode(T.self, from: data)

                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }

    func requestData(url: String, completion: @escaping (Result<Data?, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            completion(.success(data))
        }
        dataTask.resume()
    }
 }
