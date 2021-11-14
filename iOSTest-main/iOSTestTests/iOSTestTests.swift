//
//  iOSTestTests.swift
//  iOSTestTests
//
//  Created by Vishnu Sasikumar on 10/11/21.
//

import XCTest
@testable import iOSTest

class iOSTestTests: XCTestCase {

    var sut: ViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableViewIsNotNilAfterViewDidLoad() throws {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewModelIsNotNil() throws {
        XCTAssertNotNil(sut.viewModel)
    }

    func testViewModelShouldHaveFourOrders() throws {
        XCTAssertEqual(sut.viewModel.orders.value.count, 4)
    }
    
    func testGetOrderTotal() throws {
        let product1 = Product(productCode: 1, description: "", brand: "", price: 1.1, quantity: 1)
        let product2 = Product(productCode: 2, description: "", brand: "", price: 2.2, quantity: 2)
        let order = Order(id: 123, description: "test get order total", orderDate: "2021-11-14", deliveryDate: nil, products: [product1, product2])
        XCTAssertEqual(order.getOrderTotal(), 5.5)
    }

}
