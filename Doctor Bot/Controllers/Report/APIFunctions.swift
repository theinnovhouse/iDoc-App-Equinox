//
//  APIFunctions.swift
//  Doctor Bot
//
//  Created by Gokul Nair on 30/01/21.
//

import Foundation
import Alamofire

struct Report: Decodable{
    var _id: String
    var date: String
    var doctor:String
    var issue:String
    var medicine:String
    var blood:String
//    var weight:Int
//    var height:Int
//    var heartDiseases: String
//    var hospital: String
}

class APIFunctions{
    var delegate:DataDelegate?
    // creates and instance of the file so that other files can interact with it
    
    static let functions = APIFunctions()
    
    //MARK:- NOTES FETCHING FUNCTION
    
    func fetchReport(){
        
        //Enter your local host URL
        AF.request("http://192.168.0.7:8082/fetch").response{ response in
            
            //print(response.data)
            
            let data = String(data: response.data!, encoding: .utf8)
            
            self.delegate?.updateArray(newArray: data!)
            
            print(data!)
            print("hello")
            
        }
    }
    
    //MARK:- ADD NOTES FUNCTION
    
    func addReport(date: String, doctorName: String, issue: String, medicine:String, blood:String){
        
        //Enter your local host URL
        AF.request("http://192.168.0.7:8082/create", method: .post, encoding:  URLEncoding.httpBody, headers: ["doctor": doctorName, "date": date, "issue": issue, "medicine": medicine, "blood": blood]).responseJSON{response in
            print(response)
            
        }
        
    }
    
    //MARK:- UPDATE NOTES FUNCTION
    
    func updateReport(date: String, doctorName: String, issue: String, medicine:String,id: String){
        
        //Enter your local host URL
        AF.request("http://192.168.0.7:8082/update",method: .post, encoding: URLEncoding.httpBody,headers: ["doctor": doctorName, "date": date, "issue": issue,"medicine": medicine ,"id": id]).responseJSON{response in
            print(response)
        }
        
    }
    
    //MARK:- DELETE NOTES FUNCTION
    
    func deleteReport(id: String){
        //Enter your local host URL
        AF.request("http://192.168.0.7:8082/delete",method: .post, encoding: URLEncoding.httpBody,headers: ["id": id]).responseJSON{response in
            print(response)
        }
    }
}
