//
//  NewTrackViewController.swift
//  UIKitdz1
//
//  Created by MacBook on 28.09.2022.
//
import AVFoundation
import UIKit
/// Экран с первым треком
class NewTrackViewController: UIViewController {
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var timeSlider: UISlider!
    
  /// Название трека
    var nameTrackLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        label.frame = CGRect(x: 154, y: 456, width: 120, height: 34)
        return label
    }()
    
    var player = AVAudioPlayer()
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createImage()
        playMusic()

    }
    /// Слайдер звук
    @IBAction func volumeSlider(_ sender: UISlider) {
        player.volume = Float(TimeInterval(sender.value))
    }
    /// Слайдер трека
    @IBAction func timeSlider(_ sender: UISlider) {
        player.currentTime = TimeInterval(timeSlider.value)
        timeSlider.maximumValue = Float(player.duration)
        player.play()
    }
    /// Play кнопка
    @IBAction func playButton(_ sender: UIButton) {
        let pause = UIImage(systemName: "pause.circle")
        let play = UIImage(systemName: "play.circle")
        
        if player.isPlaying == false {
            self.player.play()
            sender.setImage(pause, for: .normal)
        } else {
            self.player.pause()
            sender.setImage(play, for: .normal)
        }
    }
    /// Кнопка вперед
    @IBAction func forwardButton(_ sender: UIButton) {
        player.currentTime += 10
        
    }
    /// Кнопка назад
    @IBAction func backButton(_ sender: UIButton) {
        player.currentTime -= 10
    }
    
    @objc private func updateTime() {
        timeSlider.value = Float(player.currentTime)
        let currentTime = player.currentTime
        let minutes = Int(currentTime / 60)
        let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
                startTimeLabel.text = NSString(format: "%02d:%02d", minutes, seconds) as String

        let difTime = player.currentTime - player.duration
        let difminutes = Int(difTime / 60)
        let difseconds = Int(-difTime.truncatingRemainder(dividingBy: 60))
                endTimeLabel.text = NSString(format: "%02d:%02d", difminutes, difseconds) as String
    }
    
    private func playMusic() {
        do {
            if let audio = Bundle.main.path(forResource: "Busido_-_Pervaya_zapoved_samuraya_(Gybka.com)", ofType: "mp3") {

                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audio))
                self.timeSlider.maximumValue = Float(player.duration)
                    }
                } catch {
                    print("Error")
                }
            }
    private func createImage() {

            self.title = "Playing from album"
        albumImage.layer.cornerRadius = 30
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = 14

               timer = Timer.scheduledTimer(timeInterval: 1,
                                            target: self,
                                            selector: #selector(updateTime),
                                            userInfo: nil,
                                            repeats: true)
               view.addSubview(nameTrackLabel)
    
    }
    
}
