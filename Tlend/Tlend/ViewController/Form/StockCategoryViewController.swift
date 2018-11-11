//
//  StockCategoryViewController.swift
//  Tlend
//
//  Created by KanghoonOh on 2018. 11. 11..
//  Copyright © 2018년 LeeHyeJin. All rights reserved.
//

import UIKit

class StockCategoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(FormCheckTableViewCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    @IBAction func touchUpNextButton(_ sender: Any) {
    }
    
    @IBAction func touchUpBeforeButton(_ sender: Any) {
    }
}

extension StockCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(FormCheckTableViewCell.self, for: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Const.cellHeight
    }
}

extension StockCategoryViewController: UITableViewDelegate {
    
}
