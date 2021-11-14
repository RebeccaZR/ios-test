//
//  ProductCellViewModel.swift
//  iOSTest
//
//  Created by Rebecca Zhang on 2021/11/14.
//

import Foundation

class ProductCellViewModel: RowViewModel {
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
}
