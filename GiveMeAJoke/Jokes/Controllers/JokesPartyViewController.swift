

import UIKit
import GameKit
import GoogleMobileAds

class JokesPartyViewController: UIViewController, GADBannerViewDelegate, GADInterstitialDelegate, SwipeableCardViewDataSource {

    
    let primaryColor = UIColor(hexString: "#D6CCE3")
    let secondaryColor = UIColor(hexString: "#000000")
    
    @IBOutlet private weak var swipeableCardView: SwipeableCardViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .black
        
        swipeableCardView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func shareQuestion(_ sender: Any) {
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        
        let stitchedImages = self.view.capture()
        
        UIGraphicsEndImageContext()
        
        var imagesToShare = [AnyObject]()
        imagesToShare.append(stitchedImages!)
        
        let activityViewController = UIActivityViewController(activityItems: imagesToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

extension UIView {
    
    func capture() -> UIImage? {
        var image: UIImage?
        
        if #available(iOS 10.0, *) {
            let format = UIGraphicsImageRendererFormat()
            format.opaque = isOpaque
            let renderer = UIGraphicsImageRenderer(size: frame.size, format: format)
            image = renderer.image { context in
                drawHierarchy(in: frame, afterScreenUpdates: true)
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(frame.size, isOpaque, UIScreen.main.scale)
            drawHierarchy(in: frame, afterScreenUpdates: true)
            image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        
        return image
    }
    

    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.init(red:221/255.0, green:221/255.0, blue:221/255.0, alpha: 1.0).cgColor
        layer.shadowOpacity = 0.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 20
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    

    func dropShadow(color: UIColor, opacity: Float = 1, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}


extension JokesPartyViewController {
    
    func numberOfCards() -> Int {
        return viewModels.count
    }
    
    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
        let viewModel = viewModels[index]
        let cardView = SampleSwipeableCard()
        cardView.viewModel = viewModel
        return cardView
    }
    
    func viewForEmptyCards() -> UIView? {
        showAlert(withTitle:"Swipe!", withMessage: "Read the jokes and have fun")
        return nil
    }
    
}

extension JokesPartyViewController {
    
    var viewModels: [SampleSwipeableCellViewModel] {
        
        let q1 = SampleSwipeableCellViewModel(title: "There were two peanuts walking down a dark alley, one was assaulted.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#000000"))
        
        let q2 = SampleSwipeableCellViewModel(title: "What do you call a sleepwalking nun... A roamin’ Catholic.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q3 = SampleSwipeableCellViewModel(title: "How do you make holy water? You boil the hell out of it.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q4 = SampleSwipeableCellViewModel(title: "What did the 0 say to the 8? Nice belt!",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q5 = SampleSwipeableCellViewModel(title: "Why did the orange stop? Because, it ran outta juice.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))

        let q6 = SampleSwipeableCellViewModel(title: "What’s brown and sounds like a bell? Dung!",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))

        let q7 = SampleSwipeableCellViewModel(title: "Knock knock. Who’s there? Interrupting Cow. Interrupting Cow who- MOOOOOOO!",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))

        let q8 = SampleSwipeableCellViewModel(title: "Why did the storm trooper buy an iphone? He couldn’t find the Droid he was looking for.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))

        let q9 = SampleSwipeableCellViewModel(title: "Knock knock...who’s there? I eat mop. I eat mop who? Ooooo gross! (now do you get the earlier one?)",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))

        let q10 = SampleSwipeableCellViewModel(title: "Why is six afraid of seven? Because seven ate nine.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q11 = SampleSwipeableCellViewModel(title: "How many Alzheimer’s patients does it take to change a light bulb?..... To get to the other side!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q12 = SampleSwipeableCellViewModel(title: "What do you call a masturbating cow? Beef stroganoff.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q13 = SampleSwipeableCellViewModel(title: "What do you have when you have two little green balls in the palm of your hand?? Answer: Kermit’s undivided attention!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q14 = SampleSwipeableCellViewModel(title: "What did one snowman say to the other? Nice balls.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q15 = SampleSwipeableCellViewModel(title: "How do you make a tissue dance? You put a little boogie in it.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q16 = SampleSwipeableCellViewModel(title: "Why did the policeman smell bad? He was on duty.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q17 = SampleSwipeableCellViewModel(title: "Why does Snoop Dogg carry an umbrella? FOR DRIZZLE!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q18 = SampleSwipeableCellViewModel(title: "Why can’t you hear a pterodactyl in the bathroom? Because it has a silent pee..",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q19 = SampleSwipeableCellViewModel(title: "What did the Zen Buddhist say to the hotdog vendor? Make me one with everything.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q20 = SampleSwipeableCellViewModel(title: "What kind of bees make milk instead of honey? Boobies.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q21 = SampleSwipeableCellViewModel(title: "What do you get when you cross an elephant and a rhino? Elephino!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q22 = SampleSwipeableCellViewModel(title: "What did the farmer say when he couldn’t find his tractor? “Where’s my Tractor?!”",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q23 = SampleSwipeableCellViewModel(title: "Have you heard about the duck that was arrested for stealing? He was selling “quack”.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q24 = SampleSwipeableCellViewModel(title: "What do you call a cow with two legs? Lean beef.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q25 = SampleSwipeableCellViewModel(title: "How do you catch a unique rabbit? You ‘neek’ up on it.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q26 = SampleSwipeableCellViewModel(title: "What do you get when you cross an insomniac, an agnostic and a dyslexic? Someone who lays awake at night wondering if there really is a dog.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q27 = SampleSwipeableCellViewModel(title: "I used to date a dyslexic woman. I took her home and she ended up cooking my sock.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q28 = SampleSwipeableCellViewModel(title: "What did one tampon say to the other tampon? Nothing! They were both stuck up bitches.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q29 = SampleSwipeableCellViewModel(title: "A bowlegged doe comes walking out of the woods. Says “that’s the last time I do that for ten bucks”",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))

        let q30 = SampleSwipeableCellViewModel(title: "What do you call a deer with no eyes? No eye deer.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        /////////////////////////////////////////////////////////////////////////////////////////////////
        
        let q31 = SampleSwipeableCellViewModel(title: "What’s the last thing that goes through a bug’s mind as he hits the windshield? His butt.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#000000"))
        
        let q32 = SampleSwipeableCellViewModel(title: "Knock knock- who’s there? Dwayne. Dwayne who? Dwayne the tub I’m dwounding!.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q33 = SampleSwipeableCellViewModel(title: "The past, present and future walk into a bar. It was tense.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q34 = SampleSwipeableCellViewModel(title: "Why was Tiger looking in the toilet? He was looking for Pooh!",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q35 = SampleSwipeableCellViewModel(title: "What do you get when you throw a piano down a mine shaft? A flat mine",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q36 = SampleSwipeableCellViewModel(title: "Have you heard about the cannibal that passed his brother in the forest?",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q37 = SampleSwipeableCellViewModel(title: "Who’s there?” ... “Control freak. Okay now you say, ‘Control freak who?”",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q38 = SampleSwipeableCellViewModel(title: "A pirate walks into a bar with a ship’s steering wheel hanging from his crotch. Bartender says, what the hell is that? Pirate says, I dunno, but it’s drivin’ me nuts!",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q39 = SampleSwipeableCellViewModel(title: "What’s the difference between a straight woman and a bisexual woman? 4 drinks.",
                                              subtitle: "Jokes 🤪",
                                              color: UIColor(hexString: "#6B1560"))
        
        let q40 = SampleSwipeableCellViewModel(title: "How do you make a hormone? Don’t pay her!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q41 = SampleSwipeableCellViewModel(title: "What’s the hardest part of a vegetable to eat? The wheelchair.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q42 = SampleSwipeableCellViewModel(title: "I used to be into sadism, necrophilia, and bestiality, but I realized I was just beating a dead horse.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q43 = SampleSwipeableCellViewModel(title: "Confucius says, when naked man walk through doorway sideways, he going to Bangkok.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q44 = SampleSwipeableCellViewModel(title: "Why did the walrus go to the Tupperware party? He was looking for a tight seal!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q45 = SampleSwipeableCellViewModel(title: "Horse walks into a bar. Bartender says, “Why the long face?”",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q46 = SampleSwipeableCellViewModel(title: "A mushroom walks into a bar. The bartender says, “Hey, get out of here! We don’t serve mushrooms here”. Mushroom says, “why not? I’m a fungi!”",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q47 = SampleSwipeableCellViewModel(title: "I never make mistakes...I thought I did once; but I was wrong.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q48 = SampleSwipeableCellViewModel(title: "What’s Beethoven’s favorite fruit?...Ba-na-na-naaa!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q49 = SampleSwipeableCellViewModel(title: "How do you catch a tame rabbit? The ‘tame’ way.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q50 = SampleSwipeableCellViewModel(title: "What did the green grape say to the purple grape? BREATHE!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q51 = SampleSwipeableCellViewModel(title: "Knock, knock. Who’s there? Hippa. Hippa who? I’m sorry, I’can’t tell you that.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q52 = SampleSwipeableCellViewModel(title: "What do men and tile have in common? If you lay them right the first time you can walk all over them the rest of your life!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q53 = SampleSwipeableCellViewModel(title: "How many flies does it take to screw in a light bulb? Two.... but I don’t know how they got in there.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q54 = SampleSwipeableCellViewModel(title: "Why did the blonde have a sore belly button? Because there are blonde men too!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q55 = SampleSwipeableCellViewModel(title: "Where does a bee keep his stinger? In his honey!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q56 = SampleSwipeableCellViewModel(title: "Why did the stop light turn red??? You would too if you had to change in the middle if the street!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q57 = SampleSwipeableCellViewModel(title: "Bacon and eggs walk into a bar and order a beer, the bartender says sorry, we don’t serve breakfast.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q58 = SampleSwipeableCellViewModel(title: "What do you do with a dead chemist .... You Barium.",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q59 = SampleSwipeableCellViewModel(title: "What’s the difference between a woman with PMS and a Pitt Bull? – Lipstick!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        let q60 = SampleSwipeableCellViewModel(title: "If you’re American in the living room, what are you in the bathroom? European!",
                                               subtitle: "Jokes 🤪",
                                               color: UIColor(hexString: "#6B1560"))
        
        /////////////////////////////////////////////////////////////////////////////////////////////////
        
        let last = SampleSwipeableCellViewModel(title: "\nYou have finished all the cards, you can shared all cards to friends, and at this time we are already working on a new update!",
                                                subtitle: "Jokes 🤪",
                                                color: UIColor(hexString: "#4C1393"))
        
        var previouslyUsedNumbers: [Int] = []
        
        func getRandomQuestion() -> SampleSwipeableCellViewModel {
            
            if (previouslyUsedNumbers.count == viewModels.count) {
                previouslyUsedNumbers = []
            }
            var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: viewModels.count)
            
            // Picks a new random number if the previous one has been used
            while (previouslyUsedNumbers.contains(randomNumber)) {
                randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: viewModels.count)
            }
            previouslyUsedNumbers.append(randomNumber)
            
            return viewModels[randomNumber]
        }
        
        
        return [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31, q32, q33, q34, q35, q36, q37, q38, q39, q40, q41 , q42, q43 ,q44, q45 ,q46 ,q47 ,q48 ,q49 ,q50 ,q51 ,q52 ,q53 ,q54 ,q55 ,q56 ,q57 ,q58 ,q59 ,q60, last]
    }
    
}

extension JokesPartyViewController {
    
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ОК", style: .default, handler: { action in })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
