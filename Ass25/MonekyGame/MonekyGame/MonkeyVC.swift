import UIKit
import Foundation

class MonkeyVC: UIViewController {
    
    var playerView: UIImageView?
    var score: UILabel = UILabel()
    var bananaViews: [UIImageView] = []
    var counterLabel: UILabel = UILabel()
    var scoreCount = 0
    var displayLink: CADisplayLink?
    var fallSpeed: CGFloat = 5
    var fallingBananas: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPlayer()
        setupCounterLabel()
        setupScoreLabel()
        startFallingBananas()
        startDisplayLink()
    }
    
    func startDisplayLink() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink?.add(to: .current, forMode: .default)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        displayLink?.invalidate()
    }
    
    @objc func update() {
        for banana in fallingBananas {
            banana.frame.origin.y += fallSpeed
            detectCollision(bananaImageView: banana)
            if banana.frame.origin.y > view.frame.height {
                banana.removeFromSuperview()
                fallingBananas.removeAll { $0 == banana }
            }
        }
        
    }
    
    func setupPlayer() {
        let playerSize: CGFloat = 100
        let playerImageView = UIImageView(frame: CGRect(x: (view.frame.width - playerSize) / 2, y: (view.frame.height - playerSize), width: playerSize, height: playerSize))
        playerImageView.image = UIImage(named: "cool")
        playerImageView.contentMode = .scaleAspectFit
        playerImageView.isUserInteractionEnabled = true
        view.addSubview(playerImageView)
        playerView = playerImageView
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        playerImageView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        guard let playerView = playerView else {
            return
        }
        let translation = gesture.translation(in: view)
        let newX = playerView.center.x + translation.x
        let newY = playerView.center.y + translation.y
        if newX > playerView.frame.width / 2 && newX < view.frame.width - playerView.frame.width / 2 {
            playerView.center.x = newX
        }
        if newY > playerView.frame.height / 2 && newY < view.frame.height - playerView.frame.height / 2 {
            playerView.center.y = newY
        }
        gesture.setTranslation(.zero, in: view)
    }
    
    func setupBananaImageView() {
        let objectSize: CGFloat = 50
        let randomX = CGFloat.random(in: 0...(view.frame.width - objectSize))
        let bananaImageView = UIImageView(frame: CGRect(x: randomX, y: -objectSize, width: objectSize, height: objectSize))
        bananaImageView.image = UIImage(named: "banana")
        bananaImageView.contentMode = .scaleAspectFit
        bananaImageView.isUserInteractionEnabled = false
        view.addSubview(bananaImageView)
        fallingBananas.append(bananaImageView)
    }
    
    func startFallingBananas() {
        let totalFalls = 50
        var currentFall = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            if currentFall >= totalFalls {
                timer.invalidate()
                return
            }
            self.counterLabel.text = "Falls: \(currentFall + 1) from \(totalFalls)"
            self.setupBananaImageView()
            currentFall += 1
        }
    }

    func setupCounterLabel() {
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.text = "Falls: 0 from 50"
        counterLabel.textAlignment = .right
        view.addSubview(counterLabel)
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            counterLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            counterLabel.widthAnchor.constraint(equalToConstant: 120),
            counterLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func setupScoreLabel() {
        score.translatesAutoresizingMaskIntoConstraints = false
        score.text = "Score: 0"
        score.textAlignment = .left
        view.addSubview(score)
        
        NSLayoutConstraint.activate([
            score.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            score.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            score.widthAnchor.constraint(equalToConstant: 120),
            score.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func detectCollision(bananaImageView: UIImageView) {
        guard let playerView = playerView else { return }
        
        let bananaFrame = bananaImageView.frame
        let playerFrame = playerView.frame
        if playerFrame.intersects(bananaFrame) {
            scoreCount += 1
            updateScore()
            bananaImageView.removeFromSuperview()
            fallingBananas.removeAll { $0 == bananaImageView }
            fallSpeed = min(fallSpeed + 1, 25.0)
        }
    }

    func updateScore() {
        score.text = "Score: \(scoreCount)"
        if scoreCount == 20 {
                   showAlert(message: "Congrats! You've reached 20 points!")
               }
    }
    
    func showAlert(message: String) {
           let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
           
           let restartAction = UIAlertAction(title: "Restart", style: .destructive) { _ in
               self.restartGame()
           }
           alertController.addAction(restartAction)
           
           present(alertController, animated: true, completion: nil)
       }
       
       func restartGame() {
           scoreCount = 0
           score.text = "Score: 0"
           fallSpeed = min(fallSpeed + 1, 25.0)
           counterLabel.text = "Falls: 0 from 20"
           for banana in fallingBananas {
               banana.removeFromSuperview()
           }
           fallingBananas.removeAll()
           
           playerView?.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 50)
           

       }
    
}
