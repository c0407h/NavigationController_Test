//
//  EditViewController.swift
//  Navigation
//
//  Created by 이충현 on 2021/01/29.
//

import UIKit

// 프로토콜 -> 특정 객체가 갖추어야 할 기능이나 속성에 대한 설계도
// 프로토콜은 실질적으로 아무 내용이 없음. 단순한 선언형태
// 실질적 내용은 프로토콜을 사용하는 객체에서 정의
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
}


class EditViewController: UIViewController {
    
    var textWayValue: String = ""
    //수정화면에서 직접 텍스트 필드의 텍스트를 제어할 수 없기 때문에 변수 textMessage를 문자열로 만든다.
    var textMessage: String = ""
    
    //delegate 변수 생성
    var delegate : EditDelegate?
    
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblWay.text = textWayValue
        
        //viewDidLoad 함수에는 변수 textMessage 값을 텍스트 필드의 텍스트로 대입하여 텍스트 필드에 나타나게 한다.
        txMessage.text = textMessage
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        // 수정화면의 btnDone 함수에서 didMessageEditDone을 호출하면서 수정화면의 텍스트 필드 내용을
        // 메시지 문자열로 전달
        // 즉 수정화면의 텍스트 필드의 내용(데이터)를 메인화면으로 전달
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
        }
        
        
        // 전환된 뷰를 다시 되돌릴때 pop의 형태로 해야 되돌아감
        _ = navigationController?.popViewController(animated: true)
        
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
