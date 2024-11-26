//
//  AdBannerCell.swift
//  UMC_KREAM
//
//  Created by 윤시진 on 11/19/24.
//

import UIKit
import SnapKit

/// 광고 사진 배너 셀
/* BaseCollectionCell 는 UICollectionViewCell 을 상속 받았는데, 이것을 AdBannerCell 이 상속받았으므로 AdBannerCell 에서도 imageView 속성 사용 가능 */
class AdBannerCell: BaseCollectionCell {
    
    static let identifier: String = "AdBannerCell"
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        constraints()
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 재사용 셀 초기화
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    // MARK: - Function
    
    /// UICollectionViewCell 은 기본적으로 아무 콘텐츠가 없기에, 셀 안에 이미지를 표시하기위해서는 imageView 를 서브뷰로 추가해주어야함
    private func addComponents() {
        self.addSubview(imageView)
    }
    
    /// imageView 의 위치 설정
    private func constraints() {
        self.imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    /// RequiredCellProtocol 상속을 받는 모델 값을 파라미터로 전달하여 해당 셀의 값 넣어준다.
    override func configure(model: any RequiredCellProtocol) {
        guard let bannerModel = model as? BannerModel else { return }
        
        self.imageView.image = UIImage(named: bannerModel.imageView)
    }
}
