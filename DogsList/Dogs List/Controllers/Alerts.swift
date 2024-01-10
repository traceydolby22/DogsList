//
//  Alerts.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/29/23.
//

import Foundation
struct AlertDogsList: Identifiable {
  let id = UUID()
  let title: String
  let message: String
 // let dismissButton: Button
}

/*struct AlertContext {
  static let invalidData = AlertDogsList(title: Text("Server Error"),
                                            message: Text("Something is wrong with data received"),
                                         dismissButton: .default(Text("OK")))

  static let invalidResponse = AlertDogsList(title: Text("Server Error"),
                                            message: Text("Invalid Response from server"),
                                             dismissButton: .default(Text("OK")))

  static let invalidURL = AlertDogsList(title: Text("Server Error"),
                                            message: Text("There's an issue with the website"),
                                        dismissButton: .default(Text("OK")))

  static let unableToComplete = AlertDogsList(title: Text("Server Error"),
                                            message: Text("Cannot complete request at this time, please check internet connection"),
                                              dismissButton: .default(Text("OK")))
}*/
