//
//  DogsAPICall.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/29/23.
//  Copyright © 2023 Raya. All rights reserved.
//

import Foundation

struct DogsAPI {
  static let shared = DogsAPI()
  static let APIKey = "live_nCanSXVljnAMlGVlZBiORvZEPxvIsgtLERXksWLHBjeOVZop25q9W1Sf0p7xwyee"
  static let baseURL = "https://api.thedogapi.com/v1"
  static let breedsURL = "breeds"
  static let searchBreed = "images/search?limit=1000&order=ASC"
}

enum APIError: Error {
  case failedToGetData
}

class DogsAPICall: Decodable, Identifiable {
  static let shared = DogsAPICall()

  func getBreeds(completion: @escaping (Result<(DogBreedsResponse), Error >) -> Void) {
    guard let url = URL(string: "\(DogsAPI.baseURL)/\(DogsAPI.breedsURL)") else {return}

    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {
      data, _, error in
      guard let data = data, error == nil else {
        return
      }

      do {
        let dogs = try JSONDecoder().decode(DogBreedsResponse.self, from: data)
        print(dogs)
        completion(.success(dogs))
      } catch {
        completion(.failure(error))
      }
    }
    task.resume()
  }

  func getdogsReferenceImageId(completion: @escaping ([DogBreedsResponse]) -> Void){
    guard let url = URL(string: "\(DogsAPI.baseURL)/\(DogsAPI.searchBreed)&api_key=\(DogsAPI.APIKey)/") else {return}
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      do{
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dogs = try decoder.decode([DogBreedsResponse].self, from: data)
        completion(dogs)
      }
      catch {
        print(error.localizedDescription)
      }
    }
    task.resume()
  }
}
