import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //Setup our poor mans DI
        Injected.reset()

        let homeViewController = HomeViewController(nibName: nil, bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)

        window!.rootViewController = UINavigationController(rootViewController: homeViewController)
        window!.makeKeyAndVisible()
        return true
    }
}
