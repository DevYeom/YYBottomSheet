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

	@IBAction func showBottomSheet(_ sender: UIButton) {
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

		let bottomSheet = YYBottomSheet.init(bottomUpTableTitle: title, dataArray: dataArray, options: nil) { (cell) in
			self.selectedFruitLabel.text = cell.titleLabel.text
		}

		bottomSheet.show()
	}
}

