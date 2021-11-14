//
//  ProductCell.swift
//  iOSTest
//
//  Created by Rebecca Zhang on 2021/11/14.
//

import UIKit

class ProductCell: UITableViewCell, CellConfiguration {

    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var viewModel: ProductCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func config(viewModel: RowViewModel) {
        guard let viewModel = viewModel as? ProductCellViewModel else { return }
        self.viewModel = viewModel
        productIdLabel.text = "\(viewModel.product.productCode)"
        brandLabel.text = viewModel.product.brand
        descLabel.text = viewModel.product.description
        priceLabel.text = "\(viewModel.product.price)"
        quantityLabel.text = "\(viewModel.product.quantity)"
    }
    
    class func reuseIdentifier() -> String {
        return "ProductCell"
    }
    
    class func xibName() -> String {
        return "ProductCell"
    }
}
