//
//  ViewController.swift
//  iOSTest
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let viewModel: ViewModel = ViewModel()
    
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        self.view.addSubview(indicator)
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        return indicator
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        NSLayoutConstraint(item: tableView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view, attribute: .centerX,
                           multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view, attribute: .leading,
                           multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .trailing,
                           relatedBy: .equal, toItem: view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: tableView,
                           attribute: .bottom,
                           relatedBy: .equal, toItem: view,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0).isActive = true
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        //TODO:-  tableView.backgroundColor = Custom color of your choice
        tableView.register(UINib(nibName: OrderCell.xibName(), bundle: nil), forCellReuseIdentifier: OrderCell.reuseIdentifier())
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initBinding()
    }
    
    func initView() {
        //TODO:-  view.backgroundColor = Custom color of your choice
        view.addSubview(tableView)
    }
    
    func initBinding() {
        viewModel.orders.addObserver(fireNow: true) { [weak self] (orders) in
            for order in orders.sorted(by: <) {
                let orderCellViewModel = OrderCellViewModel(order: order)
                orderCellViewModel.cellPressed = {
                    self?.showDetailPage(order: order)
                }
                self?.viewModel.orderCellViewModels.append(orderCellViewModel)
            }
            self?.tableView.reloadData()
        }
        
    }
    
    func showDetailPage(order: Order) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        detailVC.viewModel = OrderDetailViewModel(order: order)
       
        self.present(detailVC, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orders.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseIdentifier(), for: indexPath) as! OrderCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? OrderCell else { return }
        
        cell.config(viewModel: viewModel.orderCellViewModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let rowViewModel = viewModel.orderCellViewModels[indexPath.row] as? ViewModelClickable else { return }
        
        rowViewModel.cellPressed?()
    }
}

