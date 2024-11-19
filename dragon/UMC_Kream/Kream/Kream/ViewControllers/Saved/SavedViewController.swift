//
//  SavedViewController.swift
//  Kream
//
//  Created by 권용빈 on 10/6/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = DummySavedModel.savedModels
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView

    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.numberOfLists.text = "전체: \(data.count)개"
        view.tableView.delegate = self
        view.tableView.dataSource = self
        
        return view
    }()

}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
                    return UITableViewCell()
            }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
}
