//
//  ViewController.swift
//  GCDTest
//
//  Created by Искандер Ситдиков on 22.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var textButton : UIButton = {
        let button = UIButton()
        button.setTitle("Press me", for: .normal)
        button.backgroundColor = .cyan
        button.setTitleColor(.darkGray, for: .highlighted)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        return button
        
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "VC 1"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrowshape.left.fill"), style: .plain, target: self, action: #selector(rightBarAction))
        textButton.addTarget(self, action: #selector(buttoAction), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next button", style: .plain, target: self, action: #selector(rightBarAction))
        navigationItem.title = "New title"
       
        
        setupViews()
        setupConstraints()
//        myFunc()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViews()
        setupConstraints()
        
    }
    
    func myFunc() {
        let queue = DispatchQueue(label: "Label", attributes: [.concurrent, .initiallyInactive])
        
        queue.async {
            print("Done")
        }
        
        queue.activate()
        print("Activate")
//        queue.suspend()
//        print("suspended")
//        queue.resume()
//        print("Task finished")
        print("1")
        print("2")
        print("3")
    }
    
    func setupViews() {
        view.addSubview(textButton)
    }
    
    func setupConstraints() {
        textButton.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }
    
    @objc func buttoAction() {
        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func rightBarAction() {
        
    }
}
