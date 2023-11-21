//
//  ViewController.swift
//  Counter
//
//  Created by Aleksei Frolov on 17.11.23..
//

import UIKit

class ViewController: UIViewController {
    
    private var counterScore: UInt = 0

    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var dropCounterButton: UIButton!
    
    @IBOutlet private weak var logsField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "\(counterScore)"
        plusButton.tintColor = .red
        dropCounterButton.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        logsField.text = "История изменений:\n"
        logsField.font = UIFont.boldSystemFont(ofSize: 10)
        logsField.isEditable = false
    }
    
    private func formateDateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    private func addInfoInHistory(info: String) -> Void {
        let additionInfo = "\(formateDateToString(date: Date())) - \(info)\n"
        logsField.insertText(additionInfo)
    }
    
    @IBAction private func plusButtonTap(_ sender: Any) {
        counterScore += 1
        counterLabel.text = "\(counterScore)"
        addInfoInHistory(info: "значение увеличено на +1")
    }
    
    @IBAction private func minusButtonTap(_ sender: Any) {
        if counterScore > 0 {
            counterScore -= 1
            counterLabel.text = "\(counterScore)"
            addInfoInHistory(info: "значение уменьшено на -1")
        } else if counterScore == 0 {
            addInfoInHistory(info: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func dropCounterScore(_ sender: Any) {
        counterScore = 0
        counterLabel.text = "\(counterScore)"
        addInfoInHistory(info: "значение сброшено")
    }
}

