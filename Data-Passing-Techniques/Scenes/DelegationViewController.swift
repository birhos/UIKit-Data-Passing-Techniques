//
//  DelegationViewController.swift
//  TransferDataViewsPlayground
//
//  Created by Haydar Demir on 23.07.2023.
//

import SnapKit
import UIKit

class DelegationViewController: UIViewController, DataTransferProtocol {
    private lazy var appBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var appBarLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Delegation"
        label.textColor = .white
        return label
    }()
    
    private lazy var secondViewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Second View", for: .normal)
        button.addTarget(self, action: #selector(openSecondView), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(appBarView)
        appBarView.addSubview(appBarLabel)
        
        appBarView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.safeAreaTop + 64)
        }
        
        appBarLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.safeAreaTop + 24)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(secondViewButton)

        secondViewButton.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @objc func openSecondView() {
        let vc = SecondViewController()
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension DelegationViewController {
    func passData(data: String) {
        print("\(data)")
    }
}

protocol DataTransferProtocol {
    func passData(data: String)
}

class SecondViewController: UIViewController {
    var delegate: DataTransferProtocol?

    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .infoDark)
        button.setTitle("Send Data", for: .normal)
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Close", for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubview()
        makeConstraints()
    }

    fileprivate func addSubview() {
        view.addSubview(sendButton)
        view.addSubview(closeButton)
    }

    fileprivate func makeConstraints() {
        sendButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalTo(sendButton.snp_bottomMargin).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    @objc func sendButtonTapped() {
        delegate?.passData(data: "Hello World!")
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
