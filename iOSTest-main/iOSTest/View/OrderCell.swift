//
//  OrderTableViewCell.swift
//  iOSTest
//
//  Created by Rebecca Zhang on 2021/11/14.
//

import UIKit

class OrderCell: UITableViewCell, CellConfiguration {

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var orderDescLabel: UILabel!
    @IBOutlet weak var deliveryDateLabel: UILabel!
    
    var viewModel: OrderCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? OrderCellViewModel else { return }
        self.viewModel = viewModel
        orderIdLabel.text = "\(viewModel.order.id)"
        orderDateLabel.text = viewModel.order.orderDate
        orderDescLabel.text = viewModel.order.description
        deliveryDateLabel.text = viewModel.order.deliveryDate
    }

    class func reuseIdentifier() -> String {
        return "OrderCell"
    }
    
    class func xibName() -> String {
        return "OrderCell"
    }
}
