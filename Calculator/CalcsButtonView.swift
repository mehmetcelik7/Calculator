//
//  CalcsButtonView.swift
//  Calculator
//
//  Created by mehmet Çelik on 27.02.2025.
//

import SwiftUI


struct CalcButtonModel: Identifiable {
    
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigitsColor
    
}

struct RowOfCalcButtonModel: Identifiable {
    let id = UUID()
    let row: [CalcButtonModel]
}

struct CalcsButtonView: View {
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfCalcButtonModel] = [
        RowOfCalcButtonModel(row:
                                [CalcButtonModel(calcButton: .clear, color: foregroundTopButtonsColor),
                                 CalcButtonModel(calcButton: .negative, color: foregroundTopButtonsColor),
                                 CalcButtonModel(calcButton: .percent, color: foregroundTopButtonsColor),
                                 CalcButtonModel(calcButton: .divide, color: foregroundRightButttonsColor)]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .seven),
            CalcButtonModel(calcButton: .eight),
            CalcButtonModel(calcButton: .nine),
            CalcButtonModel(calcButton: .multiply,
            color: foregroundRightButttonsColor)]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .four),
            CalcButtonModel(calcButton: .five),
            CalcButtonModel(calcButton: .six),
            CalcButtonModel(calcButton: .divide,
            color: foregroundRightButttonsColor)]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .one),
            CalcButtonModel(calcButton: .two),
            CalcButtonModel(calcButton: .three),
            CalcButtonModel(calcButton: .add,
            color: foregroundRightButttonsColor)]),
        RowOfCalcButtonModel(row: [
            CalcButtonModel(calcButton: .undo),
            CalcButtonModel(calcButton: .zero),
            CalcButtonModel(calcButton: .decimal),
            CalcButtonModel(calcButton: .equal,
            color: foregroundRightButttonsColor)])


        ]
    
    var body: some View {

        Grid() {
            
            ForEach(buttonData) {
                RowOfCalcButtonModel in
                GridRow {
                    ForEach(RowOfCalcButtonModel.row) { calcButtonModel in
                        
                        Button(action: {
                            print("Button pressed")
                            buttonPressed(calcButton:calcButtonModel.calcButton)
                        }, label: {
                            ButtonView(calcButton: calcButtonModel.calcButton, fgColor: calcButtonModel.color, bgColor: buttonBackgroundColor)
                        })
                        
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(20))
        
    }
    
    func buttonPressed(calcButton: CalcButton) {
        
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = " 0"
        case .equal, .negative:
            print("eq/neg")
        case .decimal:
            print("decimal")
        case .percent:
            print("percent")
        case .undo:
            currentComputation = String(currentComputation.dropLast())
        case .add, .subtract, .divide, .multiply:
            print("operations")
     
        default:
            currentComputation += calcButton.rawValue
        }

    }
}


#Preview {
    CalcsButtonView(currentComputation: .constant("5+!"), mainResult: .constant("6"))
}
