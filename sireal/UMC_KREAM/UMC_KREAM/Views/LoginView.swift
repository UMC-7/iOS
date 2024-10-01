import UIKit
import SnapKit

class LoginView: UIView {

    // 상단 로고
    private let headerLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    // 아이디 라벨
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    // 비밀번호 라벨
    private let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    // 아이디 입력 필드
    private let idTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "kream@kream.co.kr"
        text.borderStyle = .roundedRect
        text.textColor = .gray
        return text
    }()
    
    // 비밀번호 입력 필드
    private let pwdTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "비밀번호를 입력해주세요"
        text.borderStyle = .roundedRect
        text.textColor = .gray
        return text
    }()
    
    // 로그인 버튼
    private let loginBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "로그인"
        configuration.baseForegroundColor = .white
        configuration.background.backgroundColor = .lightGray
        btn.configuration = configuration
        return btn
    }()
    
    // 카카오 로그인 버튼
    private let kakaologinBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "카카오로 로그인"
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        configuration.background.strokeColor = UIColor.gray
        configuration.background.strokeWidth = 1
        btn.configuration = configuration
        return btn
    }()
    
    // 애플 로그인 버튼
    private let appleloginBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Apple로 로그인"
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .black
        configuration.background.strokeColor = UIColor.gray
        configuration.background.strokeWidth = 1
        btn.configuration = configuration
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        subviews()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func subviews() {
        addSubview(headerLogoView)
        addSubview(idLabel)
        addSubview(idTextField)
        addSubview(pwdLabel)
        addSubview(pwdTextField)
        addSubview(loginBtn)
        addSubview(kakaologinBtn)
        addSubview(appleloginBtn)
    }

    private func constraints() {
        headerLogoView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(headerLogoView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(45)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            $0.height.equalTo(34)
        }
        
        pwdLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
        }
        
        pwdTextField.snp.makeConstraints {
            $0.top.equalTo(pwdLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            $0.height.equalTo(34)
        }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(pwdTextField.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            $0.height.equalTo(38)
        }
        
        kakaologinBtn.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
        
        appleloginBtn.snp.makeConstraints {
            $0.top.equalTo(kakaologinBtn.snp.bottom).offset(22)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
    }
}

