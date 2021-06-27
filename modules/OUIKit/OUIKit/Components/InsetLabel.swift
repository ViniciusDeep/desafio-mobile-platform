//
//  InsetLabel.swift
//  OUIKit
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import UIKit

public final class InsetLabel: UILabel {
    var edgeInset: UIEdgeInsets?
    
    public func setEdgeInset(edgeInset: UIEdgeInsets) {
        self.edgeInset = edgeInset
        self.invalidateIntrinsicContentSize()
    }
    
    public override func drawText(in rect: CGRect) {
        guard let newEdgeInset = self.edgeInset else {
            return super.drawText(in: rect)
        }
        return super.drawText(in: rect.inset(by: newEdgeInset))
    }
    
    public func intrinsicContentSize() -> CGSize {
        if (self.text?.count == 0 || self.edgeInset == nil) {
            return super.intrinsicContentSize
        }
        var superSize:CGSize = super.intrinsicContentSize
        superSize.height += self.edgeInset!.top + self.edgeInset!.bottom
        superSize.width += self.edgeInset!.left + self.edgeInset!.right
        return superSize
        
    }
    
}
