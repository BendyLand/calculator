//
//  ContentView.swift
//  calculator
//
//  Created by Ben Landrette on 7/23/24.
//

import SwiftUI

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .clear, .negative, .percent:
            return Color(.lightGray)
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
}

enum Operation {
    case add, subtract, multiply, divide, none
}

struct ContentView: View {
    @State var value = "0"
    
    let buttons : [[CalcButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    @State var currentOp: Operation = .none
    @State var runningNum: Float = 0.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    // Text display
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 95))
                        .foregroundColor(.white)
                }
                .padding()
                // Buttons
                ForEach(buttons, id: \.self) {row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight()
                                    )
                                    .background(item.buttonColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                                    .font(.system(size: 42))
                            })
                        }
                    }
                    .padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTap(button: CalcButton) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            switch button {
            case .add:
                self.currentOp = .add
                self.runningNum = Float(self.value) ?? 0.0
                print(runningNum)
                self.value = "0"
            case .subtract:
                self.currentOp = .subtract
                self.runningNum = Float(self.value) ?? 0.0
                self.value = "0"
            case .multiply:
                self.currentOp = .multiply
                self.runningNum = Float(self.value) ?? 0.0
                self.value = "0"
            case .divide:
                self.currentOp = .divide
                self.runningNum = Float(self.value) ?? 0.0
                self.value = "0"
            default:
                let running = self.runningNum
                let current = Float(self.value) ?? 0.0
                switch self.currentOp {
                case .add:
                    self.value = "\(running + current)"
                case .subtract:
                    self.value = "\(running - current)"
                case .multiply:
                    self.value = "\(running * current)"
                case .divide:
                    if current != 0.0 {
                        self.value = "\(running / current)"
                    }
                    else {
                        self.value = "0"
                    }
                case .none:
                    break
                }
            }
        case .clear:
            self.value = "0"
        case .decimal, .negative, .percent: // not supported yet
            switch button {
            case .decimal:
                if !self.value.contains(".") {
                    self.value = "\(self.value)."
                }
            case .negative:
                if self.value.contains("-") {
                    let start = self.value.index(self.value.startIndex, offsetBy: 1)
                    let newStr = self.value[start...]
                    self.value = "\(newStr)"
                }
                else {
                    self.value = "-\(self.value)"
                }
            case .percent:
                let maxLen = self.value.count
                var num = Float(self.value) ?? 0
                num /= 100
                if maxLen < 3 {
                    self.value = "\(num)"
                }
                else {
                    let divisor = pow(10.0, Double(maxLen))
                    num = Float(round(Double(num) * divisor) / divisor)
                    self.value = "\(num)"
                }
            default:
                break
            }
        default:
            let num = button.rawValue
            if self.value == "0" {
                self.value = num
            }
            else {
                self.value = "\(self.value)\(num)"
            }
        }
    }
    
    func buttonWidth(item: CalcButton) -> CGFloat {
        if item == .zero {
            return (UIScreen.main.bounds.width - (5*12)) / 2
        }
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - (5*12)) / 4
    }
}

#Preview {
    ContentView()
}
