//
//  OrderDetailViewController.swift
//  iOSTest
//
//  Created by Rebecca Zhang on 2021/11/14.
//

import UIKit

class OrderDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var orderDescLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var deliveryDateLabel: UILabel!
    @IBOutlet weak var orderTotalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: OrderDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
        // Do any additional setup after loading the view.
    }
    
    private func configView() {
        orderIdLabel.text = "\(viewModel.order.id)"
        orderDescLabel.text = viewModel.order.description
        orderDateLabel.text = viewModel.order.orderDate
        deliveryDateLabel.text = viewModel.order.deliveryDate
        orderTotalLabel.text = "\(viewModel.order.getOrderTotal())"
        
        tableView.register(UINib(nibName: ProductCell.xibName(), bundle: nil), forCellReuseIdentifier: ProductCell.reuseIdentifier())
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.order.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseIdentifier(), for: indexPath) as! ProductCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ProductCell else { return }
        
        cell.config(viewModel: ProductCellViewModel(product: viewModel.order.products[indexPath.row]))
    }
}
