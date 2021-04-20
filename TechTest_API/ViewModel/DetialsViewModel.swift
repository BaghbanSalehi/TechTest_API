//
//  DetialsViewModel.swift
//  TechTest_API
//
//  Created by Shayan Bsalehi on 20/04/2021.
//

import Foundation

class DetailsViewModel{
    
    var data : PicData?
    
    func getTitle()->String{
        guard let data = data else {
            return ""
        }
        return data.title
    }
    
    func getDesc()->String{
        guard let data = data else {
            return ""
        }
        return data.desc
    }
    
    func getUrl() -> URL{
        guard let data = data else{
            return URL(string: "")!
        }
        return URL(string: data.url)!
    }
    
}
