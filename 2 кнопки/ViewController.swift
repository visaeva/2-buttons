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
        
        TextChanges.isEditable = false
        TextChanges.isSelectable = false
        
        if labelNumer > 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let date = formatter.string(from: Date())
            
            startText = "\(date) : значение изменено на +1 \n"
            TextChanges.text.append(startText)
            TextChanges.scrollRangeToVisible(NSMakeRange(TextChanges.text.count - 1, 1))
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
            TextChanges.text.append(startText)
            TextChanges.scrollRangeToVisible(NSMakeRange(TextChanges.text.count - 1, 1))
        }
        if labelNumer != 0 {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
            let date = formatter.string(from: Date())
            startText = "\(date) : значение изменено на -1 \n"
            TextChanges.text.append(startText)
            TextChanges.scrollRangeToVisible(NSMakeRange(TextChanges.text.count - 1, 1))
            
            
        }
        
    }
    
    @IBAction func deleteCount(_ sender: Any) {
        labelCount.text = "0"
        labelNumer = 0
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = formatter.string(from: Date())
        startText = "\(date): значение сброшено \n"
        TextChanges.text.append(startText)
        TextChanges.scrollRangeToVisible(NSMakeRange(TextChanges.text.count - 1, 1))
    }
    
    @IBOutlet weak var TextChanges: UITextView!
    var startText = "История изменений:"
    
    // @IBOutlet weak var textDate: UITextView!
    
    
    
    
    override func viewDidLoad() {
        labelCount.text = String(labelNumer)
        super.viewDidLoad()
        TextChanges.text = startText
        
    }
    
    
}

