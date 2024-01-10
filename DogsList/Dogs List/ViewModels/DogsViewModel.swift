//
//  DogsViewModel.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/29/23.
//

import Foundation
final class DogsViewModel: ObservableObject {

  @Published var dogs: Dogs = []
  //@Published var alertItem: AlertDogsList?

 /* func getDogs() {
    DogBreedService.shared.getDogsService { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let dogs):
          self.dogs = dogs
        case .failure(let error):
          switch error {
          case.invalidURL:
            self.alertItem = AlertContext.invalidURL

          case .invalidData:
            self.alertItem = AlertContext.invalidData

          case .invalidResponse:
            self.alertItem = AlertContext.invalidResponse

          case .unableToComplete:
            self.alertItem = AlertContext.unableToComplete
          }
        }
      }
    }
  }*/
}
