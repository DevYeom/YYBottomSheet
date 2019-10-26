//
//  SimpleToast.swift
//  Pods
//
//  Created by DevYeom on 04/06/2019.
//

import UIKit

@available(iOS 10.0, *)
public class SimpleToast: UIView {

    // MARK: - Static Constants
    fileprivate static let ShowDuration: Double = 3.0
    fileprivate static let BackgroundColor: UIColor = UIColor.init(red: 50 / 255.0, green: 65 / 255.0, blue: 117 / 255.0, alpha: 1.0)
    fileprivate static let BeginningAlpha: CGFloat = 1.0
    fileprivate static let MessageFont: UIFont = UIFont.boldSystemFont(ofSize: 15)
    fileprivate static let MessageColor: UIColor = UIColor.white

    // MARK: - Variables
    fileprivate var currentView: UIView!
    fileprivate var toastLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    public var showDuration: Double = SimpleToast.ShowDuration
    public var message: String = ""

    // MARK: - Initialization
    init?(message: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))

        // check keyWindow's state
        if self.viewNotReady() {
            return nil
        }

        self.message = message
        self.setupView()
        self.setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Customizable Variables
    public var backColor: UIColor = SimpleToast.BackgroundColor {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.backgroundColor = backColor
            }
        }
    }

    public var beginningAlpha: CGFloat = SimpleToast.BeginningAlpha {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.alpha = beginningAlpha
            }
        }
    }

    public var messageFont = SimpleToast.MessageFont {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.toastLabel.font = messageFont
            }
        }
    }

    public var messageColor = SimpleToast.MessageColor {
        didSet {
            weak var weakSelf = self
            if let weakSelf = weakSelf {
                weakSelf.toastLabel.textColor = messageColor
            }
        }
    }

    // MARK: - Setup
    // cannot use when keywindow is nil
    func viewNotReady() -> Bool {
        return UIApplication.shared.keyWindow == nil
    }

    func setupView() {
        self.currentView = UIApplication.shared.keyWindow?.rootViewController?.view

        // Setup View
        self.backgroundColor = self.backColor
        self.layer.cornerRadius = 10
        self.alpha = self.beginningAlpha
        self.clipsToBounds = true

        // Setup Label
        self.toastLabel.backgroundColor = UIColor.clear
        self.toastLabel.textColor = self.messageColor
        self.toastLabel.textAlignment = NSTextAlignment.center
        self.toastLabel.numberOfLines = 0
        self.toastLabel.text = self.message
        self.toastLabel.font = self.messageFont
        self.addSubview(self.toastLabel)

        self.currentView.addSubview(self)
    }

    func setupAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.toastLabel.translatesAutoresizingMaskIntoConstraints = false

        self.leadingAnchor.constraint(equalTo: self.currentView.leadingAnchor, constant: 16).isActive = true
        self.trailingAnchor.constraint(equalTo: self.currentView.trailingAnchor, constant: -16).isActive = true
        self.bottomAnchor.constraint(equalTo: self.currentView.bottomAnchor, constant: -30).isActive = true

        self.toastLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.toastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        self.toastLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.toastLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }

    // MARK: - SimpleToast Usage
    public func show() {
        if viewNotReady() {
            return
        }

        UIView.animate(withDuration: self.showDuration, animations: {
            self.alpha = 0.0
        }, completion: {
            (isBool) -> Void in
            self.removeFromSuperview()
        })
    }
}
