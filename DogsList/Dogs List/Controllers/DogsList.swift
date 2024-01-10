//
//  DogsList.swift
//  Dogs List
//
//  Created by Tracey Dolby on 9/22/23.
//

import UIKit

class DogsList: UIViewController {

  let list: [String] = ["Images"]
  var dogModels = [DogBreedsResponse](){
    didSet{
      Task{
        @MainActor in //?
        dogsListTable.reloadData()
      }
    }
  }
  let nextButton = UIButton()

  private let dogsListTable: UITableView = {
    let table = UITableView(frame: .zero, style: .insetGrouped)
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "All the Dogs"
    view.backgroundColor = .systemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    view.addSubview(dogsListTable)
    dogsListTable.delegate = self
    dogsListTable.dataSource = self
    getBreeds()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    dogsListTable.frame = view.bounds
  }

  private func getBreeds() {
    DogsAPICall.shared.getdogsReferenceImageId {results in
      for i in results .prefix(320) {
        self.dogModels.append(i)
      }
    }
  }

  @objc func goToNextScreen() {
    let nextScreen = DogInformation()
    nextScreen.title = "Dogs Information"
    navigationController?.pushViewController(nextScreen, animated: true)
  }
}
extension DogsList: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return list.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
// where each cell is configured
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
      return UITableViewCell()
    }
    cell.parentViewController = self // passign self to collection view tableview cell so it can tell dogs list to present view controller
    cell.dogModels = dogModels
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40.0
  }

  private func tableView(_ tableView: UITableView, willDislpayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else {return}
    UIFont .systemFont(ofSize: 18, weight: .semibold)
    header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    header.textLabel?.textColor = .blue
    header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return list[section]
  }
}
