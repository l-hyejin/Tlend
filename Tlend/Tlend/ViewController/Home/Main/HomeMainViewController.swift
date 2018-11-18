//
//  HomeMainViewController.swift
//  Tlend
//
//  Created by 이혜진 on 2018. 11. 11..
//  Copyright © 2018년 LeeHyeJin. All rights reserved.
//

import UIKit

class HomeMainViewController: UIViewController {
    
    @IBOutlet weak var homeMainTableView: UITableView!
    
    lazy var headerView = IdolHeaderView.loadFromXib()
    
    struct Style {
        static let defaultHeaderHeight: CGFloat = 350
    }
    
    enum Section: Int, CaseIterable {
        case info
        case member
        case items
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        self.tableViewInit()
    }
    
    @IBAction func goSearchViewAction(_ sender: Any) {
        goSearchView()
    }
    
    private func setupUI() {
        setWhiteNavigationBar()
        
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}

extension HomeMainViewController: UITableViewDelegate {
    private func tableViewInit() {
        self.homeMainTableView.delegate = self; self.homeMainTableView.dataSource = self
        
        self.homeMainTableView.tableFooterView = UIView(frame: .zero)
        self.homeMainTableView.register(IdolInfoTableViewCell.self)
        self.homeMainTableView.register(MyStarMemberListTableViewCell.self)
        self.homeMainTableView.register(MyStarFeedTableViewCell.self)
        self.homeMainTableView.register(MyStarHomeTitleTableViewCell.self)
        let backgroundView = UIView(frame: .init(x: 0,
                                                 y: 0,
                                                 width: UIScreen.main.bounds.width,
                                                 height: Style.defaultHeaderHeight))
        backgroundView.addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        self.homeMainTableView.tableHeaderView = backgroundView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension HomeMainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        switch section {
        case .info:
            return 1
        case .member:
            return 1
        case .items:
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .info:
            let cell = tableView.dequeue(IdolInfoTableViewCell.self, for: indexPath)
            if cell.bottomView != nil {
                cell.bottomView.removeFromSuperview()
            }
            return cell
        case .member:
            let cell = tableView.dequeue(MyStarMemberListTableViewCell.self, for: indexPath)
            return cell
        case .items:
            guard indexPath.row != 0 else {
                let cell = tableView.dequeue(MyStarHomeTitleTableViewCell.self, for: indexPath)
                cell.titleLabel.text = "피드"
                return cell
            }
            
            let cell = tableView.dequeue(MyStarFeedTableViewCell.self, for: indexPath)
            return cell
        }
    }
}

extension HomeMainViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        guard offset <= 0.0 else {
            return
        }
        
        headerView.snp.remakeConstraints({ make in
            make.top.equalToSuperview().inset(min(offset, 0))
            make.bottom.leading.trailing.equalToSuperview()
        })
    }
}
