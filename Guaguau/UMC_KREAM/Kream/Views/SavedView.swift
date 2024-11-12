//
//  SavedView.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class SavedView: UIView {

    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        
        return label
    }()

    private lazy var totalNumber: UILabel = {
        let label = UILabel()
        
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = UIColor.black
        
        return label
    }()
    
    public lazy var savedView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    
}
