//
//  CallingView.swift
//  Closure Tutorial
//
//  Created by Jeremy Skrdlant on 9/4/23.
//

import SwiftUI

struct CallingView: View {
    @State var currentStep = 0;
    var body: some View {
        VStack {
            Text("Calling a function that has a closure.")
                .font(.system(.title))
            Spacer()
            CallingViewStep(step: steps[currentStep])
            HStack{
                Button("PREVIOUS") {
                    if currentStep > 0 {
                        currentStep -= 1
                    }
                }.bold()
                    .foregroundColor(currentStep == 0 ? .gray : .blue)
                Spacer()
                Button("NEXT"){
                    if currentStep < steps.count - 1 {
                        currentStep += 1
                    }
                }
                .bold()
                .foregroundColor(currentStep == steps.count - 1 ? .gray : .blue)
            }.padding(30)
            Spacer()
        }
    }
}

struct OneStep{
    var title:String
    var imageName:String
    var description:String
}

let steps = [OneStep(title: "Step 1", imageName: "TabToClosure", description: "You will notice the type of a closure is an arrow function. Tab over to it to highlight it blue."),
OneStep(title: "Step 2", imageName: "PressReturn", description: "Press Enter to have Xcode to create the template for you."),
OneStep(title: "Step 3", imageName: "ClosureTemplate", description: "You can use any variable names you want before the in part. These values are passed to you from the function itself."),
OneStep(title: "All Done", imageName: "done", description: "Fill out your function and return a value if the closure tells you to.")]

struct CallingViewStep:View{
    var step:OneStep
    var body: some View{
        VStack{
            Text(step.title)
                .font(.system(.largeTitle))
            Image(step.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(step.description)
        }
    }
}

struct CallingView_Previews: PreviewProvider {
    static var previews: some View {
        CallingView()
    }
}
