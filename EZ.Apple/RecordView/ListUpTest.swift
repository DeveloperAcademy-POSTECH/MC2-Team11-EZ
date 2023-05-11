import SwiftUI

struct ListUpTest: View {
    
    struct StateList: Identifiable {
        let id: String
        let date: Int
        let state_number: String
        let state_message: String
        let state_image: Image
        let state_description: String
        
        init(date: Int, state_number: String, state_message: String, state_image: Image, state_description: String) {
            self.id = "\(date)-\(state_number)" // 고유 식별자 생성
            self.date = date
            self.state_number = state_number
            self.state_message = state_message
            self.state_image = state_image
            self.state_description = state_description
        }
    }
    
    var data: [StateList] = [
        StateList(date: 23, state_number: "45", state_message: "Good", state_image: Image("ImgState0"), state_description: "최고"),
        StateList(date: 21, state_number: "21", state_message: "Bad", state_image: Image("ImgState0"), state_description: "최고"),
        StateList(date: 21, state_number: "89", state_message: "Very Good", state_image: Image("ImgState0"), state_description: "최고"),
        StateList(date: 22, state_number: "31", state_message: "Good", state_image: Image("ImgState1"), state_description: "최고"),
        StateList(date: 23, state_number: "59", state_message: "Good", state_image: Image("ImgState2"), state_description: "최고"),
        StateList(date: 24, state_number: "63", state_message: "Good", state_image: Image("ImgState3"), state_description: "최고"),
        StateList(date: 24, state_number: "99", state_message: "Good", state_image: Image("ImgState4"), state_description: "최고"),
        StateList(date: 26, state_number: "89", state_message: "Good", state_image: Image("ImgState5"), state_description: "최고"),
        StateList(date: 27, state_number: "68", state_message: "Good", state_image: Image("ImgState6"), state_description: "최고")
    ]
    
    
    var groupedData: [Int: [StateList]] {
        Dictionary(grouping: data, by: { $0.date })
    }
    
    var body: some View {
        List {
            ForEach(groupedData.keys.sorted().indices) { index in
                let item = groupedData[groupedData.keys.sorted()[index]]!
                Text("\(item[0].date)")
                    .font(.title)
                    .padding(.top, 20)
                ForEach(item) { subItem in
                    HStack {
                        subItem.state_image
                            .resizable()
                            .frame(width: 50, height: 50)
                            .border(Color.red)
                        Text("\(subItem.state_number)")
                        Text("\(subItem.state_message)")
                        Text("\(subItem.state_description)")
                    }
                }
                .padding(.leading)
                .listRowInsets(EdgeInsets())
            }
        }
        .background(Color.clear)
        .listStyle(PlainListStyle()) // 리스트 스타일 변경
        //.separatorStyle(.none)
    }
}

struct ListUpTest_Previews: PreviewProvider {
    static var previews: some View {
        ListUpTest()
    }
}
