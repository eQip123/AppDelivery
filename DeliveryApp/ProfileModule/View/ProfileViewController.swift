import UIKit
import SnapKit

class ProfileViewCotroller: UIViewController {
    
    private lazy var profileTitleImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "your profile")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "person image")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleUserNameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var emailImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "email")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var emailTextLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraints()
    }
    
    private func setupConstraints() {
        view.addSubview(profileTitleImg)
        profileTitleImg.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(190)
            make.height.equalTo(34)
        }
        
        view.addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(35)
            make.top.equalTo(profileTitleImg.snp.bottom).offset(65)
            make.width.height.equalTo(20)
        }
        
        view.addSubview(titleUserNameLabel)
        titleUserNameLabel.textColor = .lightGray
        titleUserNameLabel.text = "Name"
        titleUserNameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileTitleImg.snp.bottom).offset(65)
            make.left.equalTo(profileImage.snp.right).offset(15)
            make.right.equalToSuperview().inset(35)
            make.height.equalTo(20)
        }
        
        view.addSubview(emailImage)
        emailImage.snp.makeConstraints { make in
            make.left.equalTo(35)
            make.top.equalTo(profileImage.snp.bottom).offset(30)
            make.height.width.equalTo(20)
        }
        
        view.addSubview(emailTextLabel)
        emailTextLabel.textColor = .lightGray
        emailTextLabel.text = "Email"
        emailTextLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(30)
            make.left.equalTo(emailImage.snp.right).offset(15)
            make.right.equalToSuperview().inset(35)
            make.height.equalTo(20)
        }
    }
}
