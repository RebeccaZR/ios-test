//
//  OrderCellViewModel.swift
//  iOSTest
//
//  Created by Rebecca Zhang on 2021/11/14.
//

import Foundation

class OrderCellViewModel: RowViewModel, ViewModelClickable {
    
    var cellPressed: (() -> Void)?
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
}
