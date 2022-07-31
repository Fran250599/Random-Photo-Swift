//
//  ViewController.swift
//  RamdomPhoto
//
//  Created by Francisco Arguedas Garita on 30/7/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton();
        
        button.backgroundColor = .systemYellow
        button.setTitle("Random photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
    }
    
    @objc func tapButton(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
        
    }

    func getRandomPhoto(){
        let urlString =
                "https://source.unsplash.com/random/600x600"
        
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}

