//
//  CustomizeWokrout.swift
//  CORE
//
//  Created by Jakub Ruranski on 02/08/2020.
//

import SwiftUI

struct CustomizeWorkout: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @EnvironmentObject private var muscle: MuscleModel
    
    @State var startingDate: Date = Date()
    @State var endingDate: Date = Date().addingTimeInterval(3600)
    @State var showStart: Bool = false
    @State var showEnd: Bool = false
    @State var showLocation = false
    @State var goalString: String = "Select Goal"
    @State var selectedLocation: Location?
    
    @Binding var showDetail: Bool
    @Binding var showAdd: Bool
    @Binding var selectedOption: String
    
    
    var opacity = 0.5
    var rows = [
        GridItem(.flexible(minimum: 70, maximum: 130)),
        GridItem(.flexible(minimum: 70, maximum: 130))
    ]
    
   @State var titleString: String = ""
    
    
    func save() {
        // save changes
        let newWorkout = Workout(context: managedObjectContext)
        newWorkout.name = titleString
        newWorkout.startDate = startingDate
        newWorkout.endDate = endingDate
        newWorkout.location = selectedLocation
        
//        newWorkout.location = 
        // add goal and muscles and add exercises depending on muscles
        
        do {
            try self.managedObjectContext.save()
        }catch {
            let err = error.localizedDescription
            print(err)
        }
        showDetail.toggle()
        showAdd.toggle()
            
    }
    
    func exit() {
        showDetail.toggle()
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack(spacing: 2) {
                            Button(action: {exit()}) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .medium, design: .rounded))
                                .foregroundColor(Color(.label))
                            }
                            Text("Create a new workout")
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                        }
                        
                        Text("Choose muscle groups to workout")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                            .padding(.leading, 16) // maybe
                    }
                    Spacer()
                    
                    
                }
                .padding()
                .padding(.top, 30)
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    
                        LazyHGrid(rows: rows, alignment: .center) /*@START_MENU_TOKEN@*/{
                                
                            
                            ForEach(muscle.muscles.indices, id: \.self) { item in
                                Button(action: {muscle.muscles[item].selected.toggle()}) {
                                    MuscleCard(title: muscle.muscles[item].name, image: "")
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            
                            
                            }/*@END_MENU_TOKEN@*/
//                            .frame(width: 375, height: 250)
                                .frame(minHeight: 0, maxHeight: .greatestFiniteMagnitude)
                        .padding(.leading, 6)
                        
                        
                    
                    
                }
                .frame(width: 375, height: 260)
                
            
            
                VStack {
                    HStack {
                        Text("Title:")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .opacity(opacity)
                        Spacer()
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center) {
                        TextField("Full body workout", text: $titleString)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .frame(alignment: .center)
                        
                    }
                    
                    .padding()
                    .frame(width: 360, height: 50, alignment: .center)
                    .background(Color(.systemGroupedBackground))
                    .cornerRadius(10)
                }
                
                HStack {
                    VStack {
                        HStack {
                            Text("Start time:")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .opacity(opacity)
                            Spacer()
                        }.padding(.horizontal)
                        
                        
                        Button(action: { showStart.toggle()}) {
                            HStack(alignment: .center) {
                                Text(formatTimeDayFirst(date: startingDate))
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .frame(alignment: .center)
                                    .opacity(startingDate != Date() ? 1 : 0.3) // change
                            }
                            
                            .padding()
                            .frame(width: 170, height: 50, alignment: .center)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    
                    VStack {
                        HStack {
                            Text("Goal:")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .opacity(opacity)
                            Spacer()
                        }.padding(.horizontal)
                        
                        Button(action: { showEnd.toggle()}) {
                            HStack(alignment: .center) {
                                Text(goalString) //change
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .frame(alignment: .center)
                                    .opacity(0.3) // change
                            }
                            
                            .padding()
                            .frame(width: 170, height: 50, alignment: .center)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                
                HStack {
                    VStack {
                        HStack {
                            Text("Location:")
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .opacity(opacity)
                            Spacer()
                        }.padding(.horizontal)
                        
                        Button(action: {showLocation.toggle()}) {
                            HStack(alignment: .center) {
                                Text(selectedLocation?.name ?? "Gym")
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .frame(alignment: .center)
                                    .opacity(selectedLocation != nil ? 1 : 0.3)
                                
                            }
                            .padding()
                            .frame(width: 360, height: 50, alignment: .center)
                            .background(Color(.systemGroupedBackground))
                            .cornerRadius(10)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    
//                    VStack {
//                        HStack {
//                            Text("Goal:")
//                                .font(.system(size: 16, weight: .medium, design: .rounded))
//                                .opacity(opacity)
//                            Spacer()
//                        }.padding(.horizontal)
//
//                        HStack(alignment: .center) {
//                            TextField("600kcal", text: $titleString) //change
//                                .font(.system(size: 18, weight: .bold, design: .rounded))
//                                .frame(alignment: .center)
//
//                        }
//
//                        .padding()
//                        .frame(width: 170, height: 50, alignment: .center)
//                        .background(Color(.systemGroupedBackground))
//                        .cornerRadius(10)
//
//                    }
                }
                
                VStack {
                    HStack {
                        Button(action: {save()}) {
                            Text("Save")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }.padding()
                    }.frame(width: 350, height: 60, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(20)
                    .padding()
                }
    //            .edgesIgnoringSafeArea(.all)
                .frame(width: 375) //change
                .frame(maxHeight: .infinity)
                .background(Color(.systemBackground))
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: -14)
                .padding(.top)
                
                Spacer()
                
                
                
                
            }.background(Color(.systemBackground))
//            .opacity(showStart ? 0.2 : 1)
            if showStart {
                DatePickerView(changingDate: $startingDate, show: $showStart)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
         
            if showEnd {
                GoalSelectionView(calorieString: $goalString, endDate: $endingDate, startDate: $startingDate, showGoal: $showEnd)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
            if showLocation {
                LocationSelectionView(selectedLocation: $selectedLocation, show: $showLocation)
                    .animation(.easeInOut)
                    .transition(.opacity)
            }
        }
//        .onAppear {
//            
//        }
    }
}

struct CustomizeWokrout_Previews: PreviewProvider {
    static var previews: some View {
        CustomizeWorkout(showDetail: .constant(false), showAdd: .constant(false), selectedOption: .constant(""))
            .environmentObject(MuscleModel())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
