//
//  SavedView.swift
//  Kream
//
//  Created by 이은찬 on 11/12/24.
//

import UIKit

class SavedView: UIView {

    let productCount: Int

    
    //초기화
    init(frame: CGRect = .zero, productCount: Int) {
        self.productCount = productCount
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //property
    private lazy var title: UILabel = makeLabel("SAVED", font: .systemFont(ofSize: 28 , weight: .bold))

    private lazy var totalNumber: UILabel = makeLabel("전체 \(productCount)개", font: .systemFont(ofSize: 14, weight: .regular))
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()
    
    
    
    
    //함수
    //라벨함수
    private func makeLabel(_ text: String, font: UIFont) -> UILabel{
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = UIColor.black
        
        return label
    }
    
    
    
    //오토레이아웃
    private func addComponents() {
        self.addSubview(title)
        self.addSubview(totalNumber)
        self.addSubview(tableView)
    }
    
    private func constraints() {
        title.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.left.equalToSuperview().offset(10)
            $0.width.greaterThanOrEqualTo(81)
            $0.height.equalTo(45)
        }
        
        totalNumber.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(16)
            $0.left.equalToSuperview().offset(10)
            $0.width.greaterThanOrEqualTo(55)
            $0.height.equalTo(22)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(totalNumber.snp.bottom).offset(12)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
