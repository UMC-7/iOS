import UIKit
import SnapKit

class LoginView: UIView {

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        subviews()
        constraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    // 상단 로고
    private let headerLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        return imageView
    }()
    
    
    // 아이디 스택뷰
    private lazy var idStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    
    // 아이디 라벨
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    // 아이디 입력 필드
    private let idTextField: UITextField = {
        let text = UITextField()
        text.leftViewMode = .always
        text.leftView  = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        text.font = UIFont.systemFont(ofSize: 25)
        text.clipsToBounds = true
        text.layer.cornerRadius = 15
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.borderWidth = 1
        text.textColor = .gray
        
        // placeholder 텍스트 크기 설정
        let placeholderText = "예) kream@kream.co.kr"
        text.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        )
        
        return text
    }()
    
    
    // 비밀번호 스택뷰
    private lazy var pwdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    
    // 비밀번호 라벨
    private let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    // 비밀번호 입력 필드
    private let pwdTextField: UITextField = {
        let text = UITextField()
        text.leftViewMode = .always
        text.leftView  = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 1))
        text.font = UIFont.systemFont(ofSize: 25)
        text.clipsToBounds = true
        text.layer.cornerRadius = 15
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.borderWidth = 1
        text.textColor = .gray
        
        // placeholder 텍스트 크기 설정
        let placeholderText = "비밀번호를 입력해주세요"
        text.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        )
        
        return text
    }()
    
    
    // 로그인 버튼
    public let loginBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.title = "로그인"
        configuration.baseForegroundColor = .white
        configuration.background.backgroundColor = .lightGray
        btn.configuration = configuration
        return btn
    }()
    
    // 카카오 로그인 버튼
    private let kakaoLoginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "kakaologin"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    // 애플 로그인 버튼
    private let appleLoginBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "applelogin"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    // MARK: - Function
    
    private func subviews() {
        // 아이디 스택뷰
        addSubview(idStackView)
        idStackView.addArrangedSubview(idLabel)
        idStackView.addArrangedSubview(idTextField)
        
        // 패스워드 스택뷰
        addSubview(pwdStackView)
        pwdStackView.addArrangedSubview(pwdLabel)
        pwdStackView.addArrangedSubview(pwdTextField)
        
        // 아이디 비번 그룹 스택뷰
        
        
        addSubview(headerLogoView)
        addSubview(loginBtn)
        addSubview(kakaoLoginBtn)
        addSubview(appleLoginBtn)

    }

    private func constraints() {
        headerLogoView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(287)
            $0.height.equalTo(75)
        }
        
        idStackView.snp.makeConstraints {
            $0.top.equalTo(headerLogoView.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            }
            
        pwdStackView.snp.makeConstraints {
            $0.top.equalTo(idStackView.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            }
        
        loginBtn.snp.makeConstraints {
            $0.top.equalTo(pwdTextField.snp.bottom).offset(17)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            $0.height.equalTo(38)
        }
        
        kakaoLoginBtn.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(87)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
        
        appleLoginBtn.snp.makeConstraints {
            $0.top.equalTo(kakaoLoginBtn.snp.bottom).offset(22)
            $0.left.equalToSuperview().offset(47.5)
            $0.right.equalToSuperview().offset(-47.5)
            $0.height.equalTo(40)
        }
    }
}

