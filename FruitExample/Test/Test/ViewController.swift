import UIKit


class ViewController: UIViewController {
    let imageNames: [String] = [
        "apple", "broccoli", "carrot",
        "cherries", "lemon", "orange",
        "pineapple", "strawberry", "watermelon"
    ]

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for (i, imageName) in imageNames.enumerated() {
            let fruitImage = UIImage(named: imageName)!;

            let imageView = UIImageView()
            imageView.image = fruitImage;
            imageView.backgroundColor = UIColor.orange

            scrollView.addSubview(imageView)
        }

        scrollView.backgroundColor = UIColor.red
        scrollView.isPagingEnabled = true;

        debugPrint("viewDidLoad: \(scrollView.frame)")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for (i, imageView) in scrollView.subviews.enumerated() {
            imageView.frame = CGRect(
                    x: CGFloat(i) * scrollView.frame.width,
                    y: 0,
                    width: scrollView.frame.width,
                    height: scrollView.frame.height
            )
        }

        scrollView.contentSize = CGSize(
                width: CGFloat(imageNames.count) * scrollView.frame.width,
                height: scrollView.frame.height
        )

        debugPrint("viewDidLayoutSubviews: \(scrollView.frame)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
