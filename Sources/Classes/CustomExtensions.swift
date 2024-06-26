//
//  File.swift
//  
//
//  Created by MOBILE on 14/05/24.
//

import Foundation


import UIKit

// MARK: Add Toast method function in UIView Extension so can use in whole project.
extension UIView {
    func showToast(toastMessage: String, duration: CGFloat) {
    // View to blur bg and stopping user interaction
    let bgView = UIView(frame: self.frame)
    bgView.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(0.6))
    bgView.tag = 555

    // Label For showing toast text
    let lblMessage = UILabel()
    lblMessage.numberOfLines = 0
    lblMessage.lineBreakMode = .byWordWrapping
    lblMessage.textColor = .white
    lblMessage.backgroundColor = .black
    lblMessage.textAlignment = .center
    lblMessage.font = UIFont.init(name: "Helvetica Neue", size: 17)
    lblMessage.text = toastMessage

    // calculating toast label frame as per message content
    let maxSizeTitle: CGSize = CGSize(width: self.bounds.size.width-16, height: self.bounds.size.height)
    var expectedSizeTitle: CGSize = lblMessage.sizeThatFits(maxSizeTitle)
    // UILabel can return a size larger than the max size when the number of lines is 1
    expectedSizeTitle = CGSize(width: maxSizeTitle.width.getMinimum(value2: expectedSizeTitle.width), height: maxSizeTitle.height.getMinimum(value2: expectedSizeTitle.height))
//    lblMessage.frame = CGRect(x:((self.bounds.size.width)/2) - ((expectedSizeTitle.width+16)/2), y: (self.bounds.size.height/2) - ((expectedSizeTitle.height+16)/2), width: expectedSizeTitle.width+16, height: expectedSizeTitle.height+16)
        
        lblMessage.frame = CGRect(x:((self.bounds.size.width)/2) - ((expectedSizeTitle.width+16)/2), y: self.bounds.size.height - 100 , width: expectedSizeTitle.width+16, height: expectedSizeTitle.height+16)
        
    lblMessage.layer.cornerRadius = 8
    lblMessage.layer.masksToBounds = true
    lblMessage.padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    bgView.addSubview(lblMessage)
    self.addSubview(bgView)
    lblMessage.alpha = 1
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            lblMessage.alpha = 0
            bgView.alpha = 0
            bgView.removeFromSuperview()
        }
//
//    UIView.animateKeyframes(withDuration: TimeInterval(duration), delay: 0, options: [], animations: {
//        lblMessage.alpha = 1
//    }, completion: { success in
//        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: [], animations: {
//        lblMessage.alpha = 0
//        bgView.alpha = 0
//        })
//        bgView.removeFromSuperview()
//    })
}
}

extension CGFloat {
    func getMinimum(value2: CGFloat) -> CGFloat {
    if self < value2 {
        return self
    } else
    {
        return value2
        }
    }
}
        
        // MARK: Extension on UILabel for adding insets - for adding padding in top, bottom, right, left.
        
        extension UILabel {
        private struct AssociatedKeys {
            static var padding = UIEdgeInsets()
        }
        
        var padding: UIEdgeInsets? {
            get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
            }
            set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            }
        }
        
        override open func draw(_ rect: CGRect) {
            if let insets = padding {
                self.drawText(in: rect.inset(by: insets))
            } else {
            self.drawText(in: rect)
            }
        }
        
        override open var intrinsicContentSize: CGSize {
            get {
            var contentSize = super.intrinsicContentSize
            if let insets = padding {
                contentSize.height += insets.top + insets.bottom
                contentSize.width += insets.left + insets.right
            }
            return contentSize
            }
        }
    }
