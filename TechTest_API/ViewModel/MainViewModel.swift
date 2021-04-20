//
//  File.swift
//  TechTest_API
//
//  Created by Shayan Bsalehi on 20/04/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class MainViewModel{
    
    let resourceURL = "https://app.fakejson.com/q/C2S9fgRT?token=dmHBojqryGycLWvYUfItbw"
    var array = [PicData]()
    var size = Int()
    
    init() {
        
        getData(url: resourceURL)
    }
    
   private func getData(url : String ) {
        AF.request(url,method: .get).responseJSON { (response) in
            switch response.result{
            case .success(let value):
                let dataJson : JSON = JSON(value)
                self.size = dataJson.count
                self.updateData(json: dataJson)
                break
                
            case .failure(_):
                print("error")
            }
        }
        
    }
    
    func updateData(json : JSON)  {
        
        for i in 0..<size{
            let temp = PicData()
            temp.title = json["\(i)"]["title"].stringValue
            temp.desc = json["\(i)"]["describ"].stringValue
            temp.url = json["\(i)"]["url"].stringValue
            array.append(temp)
            
        }
        
    }
    
    func numberOfPics() -> Int {
        return array.count
    }
    
    func pic(at index : IndexPath) -> PicData {
        return array[index.row]
    }
    
}
