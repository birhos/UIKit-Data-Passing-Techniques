//
//  UIView+Extension.swift
//  TransferDataViewsPlayground
//
//  Created by Haydar Demir on 23.07.2023.
//

import UIKit
import SnapKit

extension UIView {
    var safeAreaTop: CGFloat {
        getWindow()?.safeAreaInsets.top ?? 0
    }

    var safeAreaBottom: CGFloat {
        getWindow()?.safeAreaInsets.bottom ?? 0
    }

    var safeAreaLeft: CGFloat {
        getWindow()?.safeAreaInsets.left ?? 0
    }

    var safeAreaRight: CGFloat {
        getWindow()?.safeAreaInsets.right ?? 0
    }
    
    fileprivate func getWindow() -> UIWindow? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window: UIWindow = windowScene.windows.first {
            return window
        }
        return nil
    }
}
