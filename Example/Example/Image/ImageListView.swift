import SwiftUI
import Atelier

struct ImageCell: View {
    let data: AnyImageBrush
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(data.name)
                    .font(.title2)
            }
            Spacer()
            Rectangle()
                .fill(Color.clear)
                .frame(width: 30, height: 30)
                .overlay {
                    Image(uiImage: data.image())
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color(UIColor.gray(.one)))
                        .frame(height: 24)
                }
                
        }
        .contentShape(Rectangle())
    }
}

struct ImageListView: View {
    let list: [AnyImageBrush]
    @State private var selected: AnyImageBrush?
    var body: some View {
        ForEach(list) { data in
            ImageCell(data: data)
                .onTapGesture { selected = data }
        }
        .sheet(item: $selected) { data in
            ImageDetailView(data: data)
        }
    }
}

struct ImageDetailView: View {
    let data: AnyImageBrush
    var body: some View {
        VStack() {
            Image(uiImage: data.image())
                .resizable()
                .scaledToFit()
                .frame(height: 48)
                .padding(.bottom, 40)
            Text(data.name)
                .font(.largeTitle)
        }
        .padding()
    }
}

extension ImageListView {
    init<Brush: ImageBrush & CaseIterable>(_ brushType: Brush.Type) {
        self.list = Brush.allCases.map(AnyImageBrush.init)
    }
}

#if DEBUG
struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ImageListView(Inset.self)
                .preferredColorScheme(.light)
        }
        List {
            ImageListView(Inset2.self)
                .preferredColorScheme(.dark)
        }
    }
}
#endif
