import SwiftUI
import Atelier

struct ColorCell: View {
    let data: AnyColorBrush
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(data.name)
                    .font(.title2)
                Text(data.color.hexString())
                    .font(.footnote)
            }
            Spacer()
            Rectangle()
                .fill(Color(data.color))
                .frame(width: 40, height: 40)
                .cornerRadius(8)
        }
        .contentShape(Rectangle())
    }
}

struct ColorListView: View {
    let list: [AnyColorBrush]
    @State private var selected: AnyColorBrush?
    var body: some View {
        ForEach(list) { data in
            ColorCell(data: data)
                .onTapGesture { selected = data }
        }
        .sheet(item: $selected) { data in
            ColorDetailView(data: data)
        }
    }
}

struct ColorDetailView: View {
    let data: AnyColorBrush
    var body: some View {
        VStack() {
            Circle()
                .fill(Color(data.color))
                .frame(height: 250)
                .padding(.bottom, 40)
            Text(data.name)
                .font(.largeTitle)
            Text(data.color.hexString())
                .font(.footnote)
        }
        .padding()
    }
}

extension ColorListView {
    init<Brush: ColorBrush & CaseIterable>(_ brushType: Brush.Type) {
        self.list = Brush.allCases.map(AnyColorBrush.init)
    }
}

#if DEBUG
struct ColorListView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ColorListView(SystemColors.self)
                .preferredColorScheme(.light)
        }
        List {
            ColorListView(SystemColors.self)
                .preferredColorScheme(.dark)
        }
    }
}
#endif
