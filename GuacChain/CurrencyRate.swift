//
//  CurrencyRate.swift
//  GuacChain
//
//  Created by Jennifer Joseph on 12/5/20.
//

import Foundation

// class CurrencyRate will hold Double values in three properties (dollarPerBTC, poundPerBTC, euroPerBTC)
// HINT: if you initialize these to 0 you do not have to create an initializer

class CurrencyRate {
    
    /// NOTE : WHENEVER WE DECODE USING JSON DECODER WE MUST USE : CODABLE
    /// Note : the names of the properties must be the same as the json, but the struct names are our own so we can name them as we want
    
    private struct Result: Codable {       // value that will hold the BPI struct is inside of another structure that we are going to hold all of our results with called Results
        var bpi: BPI
    }
    
    private struct BPI: Codable {      // how do we get key value pair for rate_float? we access it through a key named USD which is inside of BPI structure
        var USD: USDStruct
        var GBP: GBPStruct
        var EUR: EURStruct
    }
    
    private struct USDStruct: Codable {       // data structure that we are going to use to return USD value
        var rate_float: Double     // value we want to end up with
    }
    private struct GBPStruct: Codable {       // data structure that we are going to use to return GBP value
        var rate_float: Double     // value we want to end up with
    }
    
    private struct EURStruct: Codable {       // data structure that we are going to use to return EUR value
        var rate_float: Double     // value we want to end up with
    }
    
    var dollarPerBTC: Double = 0.0
    var poundPerBTC: Double = 0.0
    var euroPerBTC: Double = 0.0
    
    // use URLSession and Swift's native JSON parsing capabilities to get the rates of USD, BPR, and EUR per bitcoin. store these values in 3 vars that are respectively named above property names
    // HINT: by looking at the JSON you can see that the overall Result that you'll get has no array values, but the values that you want are nested inside a value named bpi with the nested structure first level bpi, next USD (or GBP or EUR), next rate_float
    
    // getData() accesses and parses JSON that we get through (in this case) a single URL -- THE DO BLOCK IS THE PART THAT CHANGES
    func getData(completed: @escaping ()->()) {
        let urlString = "http://api.coindesk.com/v1/bpi/currentprice.json" // API url
        print("accessing this given url: \(urlString)")
        
        // create URL
        guard let url = URL(string: urlString) else {
            print("ERROR: could not create a URL from this given url: \(urlString).")
            completed()
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // get data with .dataTask method
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
            // deal with the data
            do {
                // in first parameter of .decode(), pass in the type that we are decoding the data into -- we are going to use a set of data structures that allows us to "drill down" into the result --> bpi --> usd --> rate float
                // from above, we are going to decode Result
                let result = try JSONDecoder().decode(Result.self, from: data!)
                self.dollarPerBTC = result.bpi.USD.rate_float   // must update class properties to get JSON decoded results!
                self.poundPerBTC = result.bpi.GBP.rate_float
                self.euroPerBTC = result.bpi.EUR.rate_float
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
        task.resume()   // DON'T FORGET THIS LINE
    }
}



