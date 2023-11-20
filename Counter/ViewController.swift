//
//  ViewController.swift
//  Counter
//
//  Created by Aleksei Frolov on 17.11.23..
//

import UIKit

class ViewController: UIViewController {
    
    var counterScore: UInt = 0

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var dropCounterButton: UIButton!
    
    @IBOutlet weak var logsField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(counterScore)"
        plusButton.tintColor = .red
        dropCounterButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        logsField.text = "История изменений:\n"
        logsField.font = UIFont.boldSystemFont(ofSize: 10)
        logsField.isEditable = false
    }
    
    @IBAction func plusButtonTap(_ sender: Any) {
        counterScore += 1
        counterLabel.text = "\(counterScore)"
        addInfoInHistory(info: "значение увеличено на +1")
    }
    
    @IBAction func minusButtonTap(_ sender: Any) {
        if counterScore > 0 {
            counterScore -= 1
            counterLabel.text = "\(counterScore)"
            addInfoInHistory(info: "значение уменьшено на -1")
        } else if counterScore == 0 {
            addInfoInHistory(info: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func dropCounterScore(_ sender: Any) {
        counterScore = 0
        counterLabel.text = "\(counterScore)"
        addInfoInHistory(info: "значение сброшено")
    }
    
    func formateDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    func addInfoInHistory(info: String) -> Void {
        let additionInfo = "\(formateDateToString(date: Date())) - \(info)\n"
        logsField.insertText(additionInfo)
    }
}

