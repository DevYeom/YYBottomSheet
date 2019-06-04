//
//  YYBottomSheet.swift
//  Pods
//
//  Created by DevYeom on 19/05/2019.
//

import UIKit

@available(iOS 10.0, *)
public class YYBottomSheet {
	// MARK: - Enumerations
	public enum Components {
		case bottomUpTable
		case bottomUpToast
		case simpleToast
	}

	public enum BottomUpTableOptions {
		case allowTouchOutsideToDismiss
		case backgroundAlpha
		case tableViewHeight
		case tableRowHeight
		case tableViewCellLabelTextColor
		case tableViewSeperatorStyle
		case headerViewBackgroundColor
		case headerViewTitleLabelTextColor
	}

	public var componentType: Components
	public var bottomUpTable: BottomUpTable!

	// MARK: - Initializations
	public init(bottomUpTableTitle title: String, dataArray: Array<String>?, options: Dictionary<YYBottomSheet.BottomUpTableOptions, Any>?, completion selectHandler: BottomUpTable.SelectHandler?) {
		self.componentType = .bottomUpTable
		self.bottomUpTable = BottomUpTable.init(title: title, dataArray: dataArray, completion: selectHandler)

		for option in options ?? [:] {
			switch option.key {
			case .allowTouchOutsideToDismiss:
				if let value = option.value as? Bool {
					self.bottomUpTable.allowTouchOutsideToDismiss = value
				}
			case .backgroundAlpha:
				if let value = option.value as? CGFloat {
					self.bottomUpTable.backgroundAlpha = value
				}
			case .tableViewHeight:
				if let value = option.value as? CGFloat {
					self.bottomUpTable.tableViewHeight = value
				}
			case .tableRowHeight:
				if let value = option.value as? CGFloat {
					self.bottomUpTable.tableRowHeight = value
				}
			case .tableViewCellLabelTextColor:
				if let value = option.value as? UIColor {
					self.bottomUpTable.tableViewCellLabelTextColor = value
				}
			case .tableViewSeperatorStyle:
				if let value = option.value as? UITableViewCell.SeparatorStyle {
					self.bottomUpTable.tableViewSeperatorStyle = value
				}
			case .headerViewBackgroundColor:
				if let value = option.value as? UIColor {
					self.bottomUpTable.headerViewBackgroundColor = value
				}
			case .headerViewTitleLabelTextColor:
				if let value = option.value as? UIColor {
					self.bottomUpTable.headerViewTitleLabelTextColor = value
				}
			}
		}
	}

	public func show() {
		switch self.componentType {
		case .bottomUpTable:
			self.bottomUpTable.show()
		default:
			break
		}
	}
}
