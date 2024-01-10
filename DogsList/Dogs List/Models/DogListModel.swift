//
//  DogListModel.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/29/23.
//

import Foundation
// used https://app.quicktype.io/ to get the below info //
struct DogBreedsResponse: Codable {

    let id: String
    let url: URL
    let breeds: [Breeds]
    enum CodingKeys: String, CodingKey {
        case id, url, breeds
    }
}

struct Breeds: Codable {
  let name: String
  //let bredFor: String
  let temperament: String
 // let origin: String
}

typealias Dogs = [DogBreedsResponse]

/*struct MockData: Decodable {
  static let sampleDogs = DogBreedsResponse(id: 2,
                               name: "Afgan"
                               )
  static let dogs = [sampleDogs, sampleDogs, sampleDogs, sampleDogs ]
}*/
