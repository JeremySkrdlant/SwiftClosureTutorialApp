//
//  SampleClosure.swift
//  Closure Tutorial
//
//  Created by Jeremy Skrdlant on 9/4/23.
//

import Foundation

struct SampleClosure{
    //info is a closure we take from a developer.  It can include any code as long as it can accept a bool as a parameter. 
    func loginWithClosure(name:String, password:String, info:(Bool)->Void){
        print("We call our server with the name and password")
        print("Make sure it is encrypted and not just a simple get route")
        print("Once we get a result, we call our closure named info with the value")
        //We are calling the function the user passed us here. This is a simple login, we let everyone in :).
        info(true)
    }
    
    func runClosure(){
        //name and password are simple types but info is a function type. We are in control of what happens in the function.  The loginWithClosure function is in control of when this functin gets called. In this case, it would probably contact a server and call the info function with the loginStatus once it gets a response from the server. 
        loginWithClosure(name: "Bob", password: "Ross") { loginStatus in
            if (loginStatus){
                print("We are logged in")
            }else {
                print("We forgot our password")
            }
        }
    }
}
