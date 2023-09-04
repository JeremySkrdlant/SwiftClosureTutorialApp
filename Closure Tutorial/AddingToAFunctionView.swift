//
//  AddingToAFunctionView.swift
//  Closure Tutorial
//
//  Created by Jeremy Skrdlant on 9/4/23.
//

import SwiftUI

struct Property{
    var name:String
    var type:String
}

struct AddingToAFunctionView: View {
    @State var properties:[Property] = []
    @State var returnType = ""
    @State var currentProperty = ""
    @State var currentType = ""
    @State var closureName = ""
    
    //This is a computed value that gets built from all the information above.
    var resultString:String{
        var params = ""
        //This ternary operation will set it to Void if we haven't entered anything or it will use what we entered.
        let returnValue = returnType == "" ? "Void" : returnType
        //This is a closure, for each item in the array, you are running a closure function on it individually.
        properties.forEach { prop in
            //Note we are only adding the type. The name is not in the definition of the closure.
            params += "\(prop.type), "
        }
        //We remove the last comma in the string.
        params = String(params.dropLast(2))
        let closureNameValue = closureName == "" ? "default" : closureName
        
        //This is called String Interpolation when we use the \() to add variables into a string.
        return "func demo( \(closureNameValue) : (\(params))->\(returnValue) ) { }"
    }//End of our computed value
    
    
    var body: some View {
        VStack(alignment:.leading){
            Text("Creating a function that takes a closure.")
                .font(.system(.title))
                .padding(.vertical, 20)
            Spacer()
            ScrollView(.horizontal){
                Text(resultString)
                    .font(.system(size: 30))
            }
           
            Spacer()
            
            
            //We are most likely using the simulator but we probably should think about the design of this.  What happens when the keyboard shows on this app?
            Text("Custom Inputs")
                .bold()
                .font(.system(size: 11))
            Divider()
            VStack(alignment:.leading){
                //This text field will not capitalize or autocorrect the text put in.  This can be useful for code which doesn't follow standard grammer.
                TextField("Closure Name", text: $closureName)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.bottom, 10)
                
                TextField("Return Type", text: $returnType)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(.bottom, 10)
                
                Text("Custom Parameter")
                    .bold()
                    .font(.system(size: 11))
                    .padding(.top, 10)
                HStack{
                    TextField("Name", text: $currentProperty)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    TextField("Type", text: $currentType)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    //This is a closure, The closure runs when you tap the button.
                    Button("+") {
                        
                        if(currentProperty == "" || currentType == ""){
                            //They didn't give enough information.
                            return
                        }
                        
                        let newProp = Property(name: currentProperty, type: currentType)
                        properties.append(newProp)
                        currentType = ""
                        currentProperty = ""
                    }
                    .bold()
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(3)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(1)
                    .background(Color.blue)
                    .cornerRadius(5)
                }
            }.padding(.bottom, 30)
            
        }.padding()
        
        
        
    }
}

struct AddingToAFunctionView_Previews: PreviewProvider {
    static var previews: some View {
        AddingToAFunctionView()
    }
}
