import UIKit
import SnapKit
import RxCocoa
import RxRelay
import RxSwift
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase
import Firebase

class ChatViewController: UIViewController {
    
    private let viewModel = ChatViewModel()
    private let disposeBag = DisposeBag()
    
    private lazy var chatTextField = UITextField()
    private lazy var sendButton = UIButton()
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
//        view.rowHeight = 100
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.configureDatabase(tableView: tableView)
        setUpConstraints()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        tableView.reloadData()
    }
    
    func bindViewModel() {
        chatTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.text)
            .disposed(by: disposeBag)
        
        sendButton.rx
            .tap
            .bind{[weak self] _ in
                self?.viewModel.sendMassage()
            }
            .disposed(by: disposeBag)
    }
    
    private func setUpConstraints() {
        view.addSubview(chatTextField)
        chatTextField.layer.borderWidth = 2
        chatTextField.layer.cornerRadius = 10
        chatTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(28)
            make.bottom.equalToSuperview().inset(123)
            make.height.equalTo(45)
            make.width.equalTo(270)
        }
        
        view.addSubview(sendButton)
        sendButton.setImage(UIImage(named: "send"), for: .normal)
        sendButton.snp.makeConstraints { make in
            make.height.width.equalTo(45)
            make.bottom.equalToSuperview().inset(123)
            make.left.equalToSuperview().inset(324)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(chatTextField).inset(50)
            make.top.equalToSuperview().inset(100)
        }
    }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.massages.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else {
            return UITableViewCell()
        }
        let messageSnapshot = viewModel.massages.value[indexPath.row]
        guard let message = messageSnapshot.value as? [String: String] else { return cell }
        let name = message[Constants.MessageFields.name] ?? ""
        let text = message[Constants.MessageFields.text] ?? ""
        cell.nameLabel.text = name
        cell.massageTextLabel.text = text
        
        return cell
    }
    
    
}

