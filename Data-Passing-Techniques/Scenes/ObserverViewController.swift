//
//  ObserverViewController.swift
//  TransferDataViewsPlayground
//
//  Created by Haydar Demir on 23.07.2023.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class ObserverViewController: UIViewController {
    var dataObservable: Observable<String>?
    var disposeBag = DisposeBag()

    private lazy var appBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()

    private lazy var appBarLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "RxDart - Observable"
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
        let dataSubject = PublishSubject<String>()
        let vc = ObserverSecondViewController()
        vc.dataSubject = dataSubject
        dataObservable = dataSubject.asObservable()
        dataObservable?
            .subscribe(onNext: { [weak self] data in
                print("\(data)")
            })
            .disposed(by: disposeBag)
        present(vc, animated: true, completion: nil)
    }
}

class ObserverSecondViewController: UIViewController {
    var dataSubject: PublishSubject<String>?

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
        dataSubject?.onNext("Hello World!")
    }

    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
