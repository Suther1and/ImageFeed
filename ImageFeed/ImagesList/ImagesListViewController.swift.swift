//
//  ViewController.swift
//  ImageFeed
//
//  Created by Pavel Barto on 30.05.2024.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var tableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .launchBG
        table.rowHeight = 200
        table.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        table.register(ImagesListCell.self, forCellReuseIdentifier: ImagesListCell.reuseIdentifier)
        table.separatorStyle = .none
        return table
    }()
    
    
    //    private lazy var tableViewCell = {
    //        let cell = UITableViewCell()
    //
    //        return cell
    //    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func setupUI() {
        self.view.backgroundColor = .launchBG
        [tableView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
    }
    func configCell(for cell: ImagesListCell) { }
    
}


//MARK: Extensions
extension ImagesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photosName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath) as? ImagesListCell else {
            return UITableViewCell()
        }
        
        let image = self.photosName[indexPath.row]
        cell.configure(with: image, and: indexPath.row.description)
        return cell
        
        
    }
}


