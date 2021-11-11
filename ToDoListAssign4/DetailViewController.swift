/*
 File : DetailViewController
 Author: Shirin Mansouri
 StudentId: 301131068
 
 Author: Shirin Mansouri
 StudentId: 301216533
 
 Last Modification Date: 10/November/2021
 
 Description : an application to Show and Edit To Do List. Include three buttons to delete and cancel and update the list .
 */

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var hasDueDate: UISwitch!
    @IBOutlet weak var txtDueDate: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults=UserDefaults.standard
        let taskName = defaults.string(forKey: "TaskName")!
        lblTitle.text = taskName
        
        // Enable Date Picker to text input 
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        txtDueDate.text = formatter.string(from: date)
        txtDueDate.textColor = .blue
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame.size = CGSize(width: 0, height: 250)
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControl.Event.editingChanged)
        txtDueDate.inputView = datePicker
        txtDueDate.isEnabled = false
        
    }
    
    @objc func datePickerValueChanged( sender: UIDatePicker)
    {
        
    }
    
    @IBAction func hasDueDateChanged(_ sender: UISwitch) {
        if (sender.isOn)
        {
            txtDueDate.isEnabled = true
        }
        else
        {
            txtDueDate.isEnabled = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
