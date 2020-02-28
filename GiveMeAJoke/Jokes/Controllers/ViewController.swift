

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate {
    
    @IBOutlet weak var quiteMeetingButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }

    
    @IBAction func shareGame(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        let text = "We are playing «Never Have I Ever» and this game is so cool😍: \"Never Have I Ever: party game!\""
        let image = UIImage(named: "AppStore")
        let shareAll = [text, image!] as [Any]
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func quiteOption(_ sender: Any) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}

