//
//  ClosureViewController.swift
//  TransferDataViewsPlayground
//
//  Created by Haydar Demir on 23.07.2023.
//

import SnapKit
import UIKit

class ClosureViewController: UIViewController {
    private lazy var appBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    private lazy var appBarLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Closure"
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
        let vc = ClosureSecondViewController()
        vc.dataUpdated = { updatedData in
            print("\(updatedData)")
        }
        present(vc, animated: true, completion: nil)
    }
}

class ClosureSecondViewController: UIViewController {
    var dataUpdated: ((String) -> Void)?

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
        dataUpdated?("Hello World!")
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
