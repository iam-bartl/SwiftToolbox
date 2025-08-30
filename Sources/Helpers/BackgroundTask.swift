#if os(iOS)
import UIKit

public final class BackgroundTask {
    private var identifier: UIBackgroundTaskIdentifier?
    private let name: String?

    public init(name: String? = nil) {
        self.name = name
    }

    deinit {
        end()
    }

    @MainActor
    public func start(onExpire: (@MainActor () -> Void)? = nil) {
        end()
        identifier = UIApplication.shared.beginBackgroundTask(withName: name, expirationHandler: {
            onExpire?()
            self.end()
        })
    }

    public func end() {
        guard let identifier else { return }
        Task { @MainActor [identifier] in
            UIApplication.shared.endBackgroundTask(identifier)
        }
        self.identifier = nil
    }
}
#endif
