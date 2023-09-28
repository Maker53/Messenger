//  Created by Stanislav Shalgin on 24.09.2023.

import UIKit

protocol Coordinator: AnyObject {
    var parent: Coordinator? { get set }
    var childs: [Coordinator] { get set }
    
    func start()
}
