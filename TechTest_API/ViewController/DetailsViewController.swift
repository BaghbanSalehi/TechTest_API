//
//  DetailsViewController.swift
//  TechTest_API
//
//  Created by Shayan Bsalehi on 20/04/2021.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {

    let viewModel = DetailsViewModel()
    let screenSize = UIScreen.main.bounds
    var titleLabel = UILabel()
    var descLabel = UILabel()
    var pic = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        view.addSubview(titleLabel)
        
        descLabel.textAlignment = .left
        descLabel.numberOfLines = 0
        descLabel.lineBreakMode = .byClipping
        descLabel.textColor = .black
        view.addSubview(descLabel)
        
        pic.clipsToBounds = true
        pic.contentMode = .scaleToFill
        view.addSubview(pic)
        
        setupConstraints()
        config()
        
        
    }
    
    func setupConstraints(){
        
        pic.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(screenSize.height * 0.5)
            $0.width.equalTo(screenSize.width)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(pic.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        descLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(5)
        }
        
        
    }
    
    func config(){
        titleLabel.text = viewModel.getTitle()
        descLabel.text = viewModel.getDesc()
        let imageData = try? Data(contentsOf: viewModel.getUrl())
        pic.image = UIImage(data: imageData!)
    }
    


}
