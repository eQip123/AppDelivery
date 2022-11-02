import UIKit
import SnapKit

class ChatTableViewCell: UITableViewCell {
    static let identifier = "chatCell"
    
     lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.numberOfLines = 1
        title.font = .systemFont(ofSize: 12, weight: .bold)
        return title
    }()
     lazy var massageTextLabel: UILabel = {
        let title = UILabel()
        title.textColor = .gray
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 20, weight: .regular)
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubview() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(5)
            make.width.equalTo(300)
//            make.height.equalTo(15)
        }
        addSubview(massageTextLabel)
        massageTextLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(5)
            make.top.equalTo(nameLabel.snp.bottom).inset(5)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(300)
//            make.height.equalTo(45)
        }
        
//        nameLabel.frame = CGRect(x: 20, y: -30, width: 300, height: 15)
//        massageTextLabel.frame = CGRect(x: 30, y: 40, width: 300, height: 60)
    }
    override func prepareForReuse() {
         super.prepareForReuse()
       
    }

    
    
}
