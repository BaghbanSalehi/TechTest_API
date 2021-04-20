//
//  ViewController.swift
//  TechTest_API
//
//  Created by Shayan Bsalehi on 20/04/2021.
//

import UIKit
import SnapKit
import SwiftSpinner

class MainViewController: UIViewController {

    var tableview = UITableView()
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableview.backgroundColor = .white
        SwiftSpinner.show("Loading")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(PicsCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.tableview.reloadData()
            SwiftSpinner.hide()
        }
        
        setupConstraints()

    }

    func  setupConstraints(){
        tableview.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

}




extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPics()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PicsCell
        let data = viewModel.pic(at: indexPath)
        cell.cellConfig(data: data)
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.viewModel.data = viewModel.pic(at: indexPath)
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
