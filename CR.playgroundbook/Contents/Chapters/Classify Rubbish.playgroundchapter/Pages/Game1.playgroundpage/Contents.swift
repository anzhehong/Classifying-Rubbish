//#-code-completion(module, hide, Swift)
//#-code-completion(identifier, hide, _setup())
//#-code-completion(identifier, hide, AbstractDrawable)
//#-code-completion(identifier, hide, _ColorLiteralType)
//#-hidden-code

import PlaygroundSupport
import UIKit
//#-end-hidden-code

/*:
 **Rules:** Use Swift to put the rubbish into the correct trash!
 
 1. First player: add some rubbish of certain types and import their images.
 2. Tap `Run My Code`
 3. Second player: tap the bag to get the rubbishes and put every rubbish into the correct trash.
 4. Then, get the final score of the second player.
 
 */
var bags = [Rubbish]()
//#-editable-code Tap to enter code


let rubbish = Rubbish(name: "bag", category: .plastic, image: #imageLiteral(resourceName: "plastic2.png"))
let rubbish2 = Rubbish(name: "bettry", category: .poisonous, image: #imageLiteral(resourceName: "poisonous2.png"))
let rubbish3 = Rubbish(name: "leaves", category: .others, image: #imageLiteral(resourceName: "normal2.png"))
bags.append(rubbish2)
bags.append(rubbish3)

//#-end-editable-code
bags.append(rubbish)
//#-hidden-code

let welcome = WelcomeViewController(bags: bags)

let page = PlaygroundPage.current

page.liveView = welcome

//#-end-hidden-code
