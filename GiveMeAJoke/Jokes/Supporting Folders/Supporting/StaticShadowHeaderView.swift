
import UIKit
import CoreMotion

class StaticShadowHeaderView: UIView, NibView {

    @IBOutlet private weak var backgroundContainerView: UIView!


    private let motionManager = CMMotionManager()


    private weak var shadowView: UIView?


    private static let kInnerMargin: CGFloat = 20.0

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()

        backgroundContainerView.layer.cornerRadius = 14.0
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()

        backgroundContainerView.layer.cornerRadius = 14.0
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        configureShadow()
    }

    private func configureShadow() {

        self.shadowView?.removeFromSuperview()
        let shadowView = UIView(frame: CGRect(x: StaticShadowHeaderView.kInnerMargin,
                                              y: StaticShadowHeaderView.kInnerMargin,
                                              width: bounds.width - (2 * StaticShadowHeaderView.kInnerMargin),
                                              height: bounds.height - (2 * StaticShadowHeaderView.kInnerMargin)))
        insertSubview(shadowView, at: 0)
        self.shadowView = shadowView
        self.applyShadow(width: CGFloat(0.0), height: CGFloat(0.0))
    }

    private func applyShadow(width: CGFloat, height: CGFloat) {
        if let shadowView = shadowView {
            let shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: 14.0)
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowRadius = 14.0
            shadowView.layer.shadowColor = UIColor.black.cgColor
            shadowView.layer.shadowOffset = CGSize(width: width, height: height)
            shadowView.layer.shadowOpacity = 0.15
            shadowView.layer.shadowPath = shadowPath.cgPath
        }
    }

}
