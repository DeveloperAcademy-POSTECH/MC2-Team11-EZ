
import SwiftUI

struct CoachMark: View {
    
    // MARK: -Propertites
    @Binding var isShowImage: Bool
    @Binding var isShowDrag: Bool
    
    // MARK: - Body
    var body: some View {
        
        if isShowImage {
            Image("ImgDrag")
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        isShowDrag.toggle()
                    }
                }
                .opacity(isShowDrag ? 0.2 : 1)
            
        }
    }
}


// MARK: - Preview
struct CoachMark_Previews: PreviewProvider {
    static var previews: some View {
        CoachMark(isShowImage: .constant(true), isShowDrag: .constant(true))
    }
}
