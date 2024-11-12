//
//  SavedView.swift
//  Kream
//
//  Created by 권용빈 on 11/6/24.
//

import UIKit

class SavedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstaints()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedTitle: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    public lazy var numberOfLists: UILabel = {
        let label = UILabel()
        label.text = "전체 0개"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    private func setViews() {
        self.addSubview(savedTitle)
        self.addSubview(numberOfLists)
        self.addSubview(tableView)
    }
    
    private func setConstaints() {
        savedTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.width.greaterThanOrEqualTo(81)
            $0.height.equalTo(45)
        }
        numberOfLists.snp.makeConstraints{
            $0.top.equalTo(savedTitle.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(13)
            $0.width.greaterThanOrEqualTo(55)
            $0.height.equalTo(22)
            
        }
        tableView.snp.makeConstraints{
            $0.top.equalTo(numberOfLists.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().offset(0)
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(0)
        }
    }


}
