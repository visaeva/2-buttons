//
//  ViewController.swift
//  2 кнопки
//
//  Created by Victoria Isaeva on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var labelCount: UILabel!
    
    private var labelNumer = 0
    
    
    
    @IBAction private func buttonPlus(_ sender: Any) {
        labelNumer = labelNumer + 1
        labelCount.text = String(labelNumer)
        
        textChanges.isEditable = false
        textChanges.isSelectable = false
        
        if labelNumer > 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let date = formatter.string(from: Date())
            
            startText = "\(date) : значение изменено на +1 \n"
            textChanges.text.append(startText)
            textChanges.scrollRangeToVisible(NSMakeRange(textChanges.text.count - 1, 1))
        }
    }
    
    @IBAction private func buttonMinus(_ sender: Any) {
        labelNumer = labelNumer - 1
        labelCount.text = String(labelNumer)
        
        if labelNumer <= 0 {
            labelNumer = 0
            labelCount.text = String(labelNumer)
            
        }
        
        if labelNumer <= 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let date = formatter.string(from: Date())
            startText = "\(date): попытка изменить счетчик меньше 0 \n"
            textChanges.text.append(startText)
            textChanges.scrollRangeToVisible(NSMakeRange(textChanges.text.count - 1, 1))
        }
        if labelNumer != 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let date = formatter.string(from: Date())
            startText = "\(date) : значение изменено на -1 \n"
            textChanges.text.append(startText)
            textChanges.scrollRangeToVisible(NSMakeRange(textChanges.text.count - 1, 1))
            
            
        }
        
    }
    
    @IBAction private func deleteCount(_ sender: Any) {
        labelCount.text = "0"
        labelNumer = 0
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = formatter.string(from: Date())
        startText = "\(date): значение сброшено \n"
        textChanges.text.append(startText)
        textChanges.scrollRangeToVisible(NSMakeRange(textChanges.text.count - 1, 1))
    }
    
    
    @IBOutlet private weak var textChanges: UITextView!
    private var startText = "История изменений:"
    
    
    
    
    
    override func viewDidLoad() {
        labelCount.text = String(labelNumer)
        super.viewDidLoad()
        textChanges.text = startText
        
    }
    
    
}

