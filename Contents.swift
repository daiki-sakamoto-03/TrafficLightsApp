import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class TrafficLights {
    
    var timer: Timer?
    var greenLimit: Int = 20
    var yellowLimit: Int = 3
    var redLimit: Int = 15
    let limit = 0
    var lightType: LightType = .green
    
    enum LightType {
        case green
        case yellow
        case red
    }

    func start() {
        // 任意の箇所でTimerクラスを使用して１秒毎にcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定（単位はn秒）
            target: self, // ここは「self」でOK
            selector: #selector(startTrafficLights), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }
    
    // Timerクラスに設定するメソッドは「@ objc」キーワードを忘れずに付与する
    @objc func startTrafficLights() {
        
        switch lightType {
        case .green:
            guard greenLimit > 0 else {
                lightType = .yellow
                greenLimit = 20
                return
            }
            greenLimit -= 1
            print("青信号は残り\(greenLimit)秒です。")
        case .yellow:
            guard yellowLimit > 0 else {
                lightType = .red
                yellowLimit = 3
                return
            }
            yellowLimit -= 1
            print("黄色信号は残り\(yellowLimit)秒です。")
        case .red:
            guard redLimit > 0 else {
                lightType = .green
                redLimit = 15
                return
            }
            redLimit -= 1
            print("赤信号は残り\(redLimit)秒です。")
        }
    }
    
    func stopButton() {
        if lightType == .red {
            timer?.invalidate()
            lightType = .green
            
        }
    }
    
}
let trafficLight = TrafficLights()
trafficLight.start()

