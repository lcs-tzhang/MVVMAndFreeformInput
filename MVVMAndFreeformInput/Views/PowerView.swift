import SwiftUI

struct PowerView: View {
    
    // MARK: Stored properties
    
    // Holds the view model, to track current state of
    // data within the app
    @State var viewModel = PowerViewModel()
    
    // MARK: Computed properties
    var body: some View {
        VStack {
            
            // Extra space at top
            Spacer()
            
            // OUTPUT
            // When the power can be unwrapped, show the result
            if let power = viewModel.power {
                
                VStack(spacing:0){
                    // Show the provided base, exponent, and result
                    // in an arrangement that looks the same as how
                    // we write a power on paper in math class
                    HStack(alignment: .center) {
                        HStack(alignment: .top) {
                            if power.base < 0 {
                                Text("(\(power.base.formatted()))")
                                    .font(.system(size: 96))
                            }else {
                                Text("\(power.base.formatted())")
                                    .font(.system(size: 96))
                            }
                            Text("\(power.exponent)")
                                .font(.system(size: 44))
                        }
                        HStack {
                            Text("=")
                                .font(.system(size: 96))
                            if power.exponent < 0 {
                                
                                let result = 1.0 / (power.base * power.base)
                                Text("\(result.formatted())")
                                    .font(.system(size: 96))
                            } else {
                                
                                Text("\(power.result.formatted())")
                                    .font(.system(size: 96))
                            }
                        }
                    }
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                 
                    
                    // Add a button so that the result can be saved
                    
                    Button {
                        viewModel.saveResult()
                        // DEBUG: Show how many items are in the resultHistory array
                        print("There are \(viewModel.resultHistory.count) elements in the resultHistory array.")
                    } label: {
                        Text("Save")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                }
                .frame(height: 200)
                
            } else {
                
                // Show a message indicating that we are
                // awaiting reasonable input
                ContentUnavailableView(
                    "Unable to evaluate power",
                    systemImage: "gear.badge.questionmark",
                    description: Text(viewModel.recoverySuggestion)
                )
                .frame(height: 200)
            }
            
            // INPUT
            TextField("Base", text: $viewModel.providedBase)
                .textFieldStyle(.roundedBorder)
            
            TextField("Exponent", text: $viewModel.providedExponent)
                .textFieldStyle(.roundedBorder)
            
            // Show a title for the history
            HStack {
                Text("History")
                    .bold()
                Spacer()
            }
            .padding(.vertical)
             
            // Iterate over the history of results
            List(viewModel.resultHistory) { priorResult in
                PowerItemView(power: priorResult)
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationTitle("Powers")
        
        
    }
    
}

#Preview {
    NavigationStack{
        PowerView()
    }
}
