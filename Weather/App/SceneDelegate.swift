
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinatable?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        
        self.window = window
        
        let coordinator = MainCityCoordinator(navigationController: navigationController)
        self.rootCoordinator = coordinator
        
        window.makeKeyAndVisible()
        coordinator.start()
        
        guard let url1 = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393&lang=ru_RU&limit=7&hours=true&extra=true&X-Yandex-API-Key=7af1f1ca-8964-40f5-8570-7abc1ba95755") else { return }
        
        
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393&extra=true") else { return }
        guard let ur2 = URL(string: "https://google.com/") else { return }
        NetworkServiceWeather().loadWeather(url: ur2)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

