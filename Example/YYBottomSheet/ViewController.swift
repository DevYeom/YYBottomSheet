//
//  ViewController.swift
//  YYBottomSheet
//
//  Created by DevYeom on 05/19/2019.
//  Copyright (c) 2019 DevYeom. All rights reserved.
//

import UIKit
import YYBottomSheet

class ViewController: UIViewController {
	@IBOutlet weak var selectedFruitLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	@IBAction func showBottomUpTable(_ sender: UIButton) {
		let title = "Fruits"
		let dataArray = ["apple", "grape", "watermelon", "banana", "strawberry", "cherry", "pineapple", "pear"]

		/* Customizable Variables
		let options: [YYBottomSheet.BottomUpTableOptions:Any] = [
			.allowTouchOutsideToDismiss: false,
			.backgroundAlpha: CGFloat(0.3),
			.tableViewHeight: CGFloat(100),
			.tableRowHeight: CGFloat(30),
			.tableViewCellLabelTextColor: UIColor.blue,
			.tableViewSeperatorStyle: UITableViewCell.SeparatorStyle.none,
			.headerViewBackgroundColor: UIColor.yellow,
			.headerViewTitleLabelTextColor: UIColor.red
		]
		*/

		let bottomUpTable = YYBottomSheet.init(bottomUpTableTitle: title, dataArray: dataArray, options: nil) { (cell) in
			self.selectedFruitLabel.text = cell.titleLabel.text
		}

		bottomUpTable.show()
	}

	@IBAction func showSimpleToast(_ sender: UIButton) {
		let id = sender.restorationIdentifier

		if id == "oneLine" {
			let message = "Hello World!"
			let simpleToast = YYBottomSheet.init(simpleToastMessage: message, options: nil)

			simpleToast.show()
		} else if id == "multipleLines" {
			let message = "Message is multiple lines\nit doesn't matter!"
			let simpleToast = YYBottomSheet.init(simpleToastMessage: message, options: nil)

			simpleToast.show()
		} else if id == "customized" {
			let options: [YYBottomSheet.SimpleToastOptions:Any] = [
				.showDuration: Double(2.0),
				.backgroundColor: UIColor.black,
				.beginningAlpha: CGFloat(0.8),
				.messageFont: UIFont.italicSystemFont(ofSize: 15),
				.messageColor: UIColor.white
			]

			let message = "SimpleToast can be customized!"
			let simpleToast = YYBottomSheet.init(simpleToastMessage: message, options: options)

			simpleToast.show()
		}
	}
}

