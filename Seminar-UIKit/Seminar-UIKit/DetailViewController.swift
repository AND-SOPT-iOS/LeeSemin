//
//  DetailViewController.swift
//  Seminar-UIKit
//
//  Created by 이세민 on 10/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "good.jpg")
        return imageView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var receivedName: String?
    private var isButton3Selected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        updateUI()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [nameLabel, resultLabel, imageView, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor,
                    constant: 20
                ),
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                resultLabel.topAnchor.constraint(
                    equalTo: nameLabel.bottomAnchor,
                    constant: 20
                ),
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                imageView.topAnchor.constraint(
                    equalTo: resultLabel.bottomAnchor,
                    constant: 20
                ),
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 200),
                imageView.heightAnchor.constraint(equalToConstant: 200),
                
                backButton.topAnchor.constraint(
                    equalTo: imageView.bottomAnchor,
                    constant: 20
                ),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 44),
                backButton.widthAnchor.constraint(equalToConstant: 300),
            ]
        )
    }
    
    func updateUI() {
        self.nameLabel.text = receivedName
        if isButton3Selected {
            self.resultLabel.text = "축하합니다"
            self.imageView.image = UIImage(named: "good.jpg")
        } else {
            self.resultLabel.text = "엥"
            self.imageView.image = UIImage(named: "icecream.jpg")
        }
    }
    
    func dataBind(name: String, isButton3Selected: Bool) {
        self.receivedName = name
        self.isButton3Selected = isButton3Selected
        updateUI()
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
