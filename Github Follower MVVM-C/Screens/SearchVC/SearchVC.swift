//
//  SearchVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class SearchVC: UIViewController {
    
    weak var coordinator: SearchCoordinator?

    let iconImageView   = UIImageView()
    let searchTextField = GFTextField()
    let calloutBtn      = GFButton(backgroundColor: .systemGreen, title: "Get followers")
    
    var isUsernameEntered: Bool { return !searchTextField.text!.isEmpty }
    var iconViewTopConstraints: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        searchTextField.text = "Sallen0400"
        setupImageView()
        setupTextfield()
        setupCalloutBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    private func setupImageView() {
        view.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.image = Images.ghLogo
        
        let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
        
        iconViewTopConstraints = iconImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant)
        iconViewTopConstraints.isActive = true
        
        NSLayoutConstraint.activate([
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 200),
            iconImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupTextfield() {
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 48),
            searchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            searchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -52),
            searchTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupCalloutBtn() {
        view.addSubview(calloutBtn)
        
        NSLayoutConstraint.activate([
            calloutBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            calloutBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            calloutBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -52),
            calloutBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }

}
