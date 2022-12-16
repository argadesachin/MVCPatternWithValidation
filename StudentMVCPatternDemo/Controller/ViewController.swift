//
//  ViewController.swift
//  StudentMVCPatternDemo
//
//  Created by Mac on 08/11/22.
//

import UIKit

class ViewController: UIViewController {

    var secondViewController : SecondViewController = SecondViewController()
    var Students : [Student] = []
    
    @IBOutlet weak var StudentTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       registerNib()
        initDataAndDelegate()
    }
    
// MARK - register tableViewCell
    func registerNib(){
        let nibName = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.StudentTableView.register(nibName, forCellReuseIdentifier: "StudentTableViewCell")
    }
    
  //MARK - data source and delegate method reference
    func initDataAndDelegate(){
        StudentTableView.dataSource = self
        StudentTableView.delegate = self
    }
    
    @IBAction func addNewStudent(_ sender: UIBarButtonItem) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.delegateOnSecondViewController = self
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

// MARK - UITableViewDataSource method
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.StudentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
        let eachStudent = Students[indexPath.row]
        studentTableViewCell.StudentIdLabel.text = String(eachStudent.StudentId)
        studentTableViewCell.StudentFirstNameLabel.text = eachStudent.StudentFirstName
        studentTableViewCell.StudentLastNameLabel.text = eachStudent.StudentLastName
        studentTableViewCell.StudentMarksLabel.text = String(eachStudent.StudentMarks)
        return studentTableViewCell
    }
}

//MARK - Delegate Method
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
}

//MARK - protocol conform to view controller

extension ViewController: BackDataPassingProtocol{
    func pssingDataToFirstViewController(student: Student) {
        let studentObject = Student(StudentId: student.StudentId, StudentFirstName: student.StudentFirstName, StudentLastName: student.StudentLastName, StudentMarks: student.StudentMarks)
        Students.append(studentObject)
        StudentTableView.reloadData()
    }
}

