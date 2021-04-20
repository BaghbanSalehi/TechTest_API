//
//  PicsCell.swift
//  TechTest_API
//
//  Created by Shayan Bsalehi on 20/04/2021.
//

import UIKit
import SnapKit

class PicsCell: UITableViewCell {

    var titleLable = UILabel()
    var picImage = UIImageView()
    let viewModel = CellViewModel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLable.textColor = .black
        titleLable.textAlignment = .center
        contentView.addSubview(titleLable)
        
        picImage.clipsToBounds = true
        contentView.addSubview(picImage)
        
        setupConstraints()
    
    }
    
    func setupConstraints(){
        
        picImage.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.height.equalTo(100)
            $0.width.equalTo(120)
        }
        
        titleLable.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().inset(25)
        }
        
    }
    
    func cellConfig(data : PicData){
        viewModel.data = data
        titleLable.text = viewModel.getTitle()
        let imageData = try? Data(contentsOf: viewModel.getUrl())
        picImage.image = UIImage(data: imageData!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
