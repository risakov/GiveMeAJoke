import UIKit
import GoogleMobileAds

class SupportViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    let primaryColor = UIColor(hexString: "#232526")
    let secondaryColor = UIColor(hexString: "#414345")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.isHidden = true
        bannerView.delegate = self
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let save = UserDefaults.standard
        if save.value(forKey: "Purchase") == nil {
            bannerView.adUnitID = "ca-app-pub-1044472511118519/8123823486"
            bannerView.adSize = kGADAdSizeSmartBannerPortrait
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        } else {
            bannerView.isHidden = true
        }
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.isHidden = false
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        bannerView.isHidden = true
    }

}
