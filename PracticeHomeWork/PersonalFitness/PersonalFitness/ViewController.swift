import UIKit

class ViewController: UIViewController {
    let imageLogo        = UIImageView()
    let labelDescription = UILabel()
    let labelEmail       = UILabel()
    let labelPassword    = UILabel()
    let txtEmail         = UITextField();
    let txtPassword = UITextField();
    let btnLogin = UIButton();

    override func viewDidLoad() {
        super.viewDidLoad()

        imageLogo.image = UIImage(named: "logo")
        imageLogo.backgroundColor = UIColor.red

        btnLogin.setTitle("Login", for: .normal)
        btnLogin.backgroundColor = UIColor.red

        labelDescription.text = "Personal trainer application"
        labelDescription.numberOfLines = 0
        labelDescription.textAlignment = .center
        labelDescription.lineBreakMode = .byWordWrapping

        labelEmail.text = "Email"
        labelEmail.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        labelEmail.font = UIFont(name:"BradleyHandITCTT-Bold", size:14)
        labelEmail.backgroundColor = UIColor.clear //Labelnek is lehet háttérszínt állítani. A UIColor.clear az átlátszó szín
        labelEmail.textAlignment = .center //Szöveg elrendezése. Leggyakrabban: jobbra/balra/középre

        labelPassword.text = "Password"
        labelPassword.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        labelPassword.font = UIFont(name:"BradleyHandITCTT-Bold", size:14)
        labelPassword.backgroundColor = UIColor.clear //Labelnek is lehet háttérszínt állítani. A UIColor.clear az átlátszó szín
        labelPassword.textAlignment = .center //Szöveg elrendezése. Leggyakrabban: jobbra/balra/középre

        txtEmail.placeholder = "Email"
        txtPassword.placeholder = "Password"

        view.addSubview(imageLogo)
        view.addSubview(labelDescription)
        view.addSubview(labelEmail)
        view.addSubview(labelPassword)
        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
        view.addSubview(btnLogin)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        btnLogin.sizeToFit();
        labelDescription.sizeToFit();
        labelEmail.sizeToFit();
        labelPassword.sizeToFit();

        let imageWidth  = CGFloat(200)
        let imageHeight = CGFloat(200)

        imageLogo.frame = CGRect(
                x: view.center.x - (imageWidth / 2),
                y: view.center.y * 0.5 - (imageHeight / 2),
                width: imageWidth,
                height: imageHeight
        );

        labelDescription.frame = CGRect(x: view.center.x - labelDescription.frame.width / 2,
                                        y: imageLogo.frame.maxY + 10,
                                        width: labelDescription.frame.width,
                                        height: labelDescription.frame.height);

        labelEmail.frame = CGRect(x: 10,
                                  y: labelDescription.frame.maxY + 10,
                                  width: labelEmail.frame.width,
                                  height: labelEmail.frame.height);

        txtEmail.frame = CGRect(x: view.frame.width * 0.1,
                                y: labelEmail.frame.maxY + 5,
                                width: view.frame.width * 0.8,
                                height: 20);

        labelPassword.frame = CGRect(x: 10,
                                     y: txtEmail.frame.maxY + 10,
                                     width: labelPassword.frame.width,
                                     height: labelPassword.frame.height);

        txtPassword.frame = CGRect(x: txtEmail.frame.minX,
                                   y: labelPassword.frame.maxY + 5,
                                   width: txtEmail.frame.width,
                                   height: txtEmail.frame.height);

        btnLogin.frame = CGRect(x: txtPassword.center.x - btnLogin.frame.width / 2,
                                y: txtPassword.frame.maxY + 5,
                                width: btnLogin.frame.width,
                                height: 20);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
