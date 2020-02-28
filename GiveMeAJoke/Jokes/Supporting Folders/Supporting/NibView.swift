import UIKit
internal protocol NibView where Self: UIView {

}

extension NibView {

    func xibSetup() {
        backgroundColor = .clear
        let view = loadViewFromNib()
        addEdgeConstrainedSubView(view: view)
    }

    fileprivate func loadViewFromNib<T: UIView>() -> T {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Cannot instantiate a UIView from the nib for class \(type(of: self))")
        }
        return view
    }
    
}
