//
//  SAVEDViewController.swift
//  Kream
//
//  Created by 이은찬 on 10/7/24.
//

import UIKit

class SavedViewController: UIViewController {

    
    let data = dummySavedProduct.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }
    
    private lazy var savedView: SavedView = {
        let savedView = SavedView(productCount: data.count)
        savedView.tableView.delegate = self
        savedView.tableView.dataSource = self
        return savedView
    }()
    }
    

    extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
                return UITableViewCell()
            }
            
            cell.configure(model: data[indexPath.row])
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }


}
