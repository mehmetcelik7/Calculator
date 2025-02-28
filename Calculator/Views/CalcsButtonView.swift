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
    let width: CGFloat
    
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
            CalcButtonModel(calcButton: .subtract,
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
                            ButtonView(calcButton: calcButtonModel.calcButton, fgColor: calcButtonModel.color, bgColor: buttonBackgroundColor, width: width)
                            
                        })
                        
                    }
                }
            }
        }
        .padding()
        .background(secondaryBackgroundColor.cornerRadius(UIDevice.isIpad ? 40 : 20))
        
    }
    
    func buttonPressed(calcButton: CalcButton) {
        
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = " 0"
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    
                    mainResult = formatResult(val: sign * calculateResult())
                    
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
            
        case .decimal:

            if  let lastoccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                
                if lastCharIsDigit(str: currentComputation) {
                    let startIndex = currentComputation.index(lastoccurenceOfDecimal, offsetBy: 1)
                    
                    let endIndex = currentComputation.endIndex
                    
                    let range = startIndex..<endIndex
                    
                    let rightSubString = String(currentComputation[range])
                    
                    if Int(rightSubString) == nil  && !rightSubString.isEmpty {
                        currentComputation += "."
                    }
                }
            }else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                }else if lastCharIsDigit(str: currentComputation) {
                    currentComputation += "."

                }
            }
            
            
            
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
            
        case .undo:
            currentComputation = String(currentComputation.dropLast())
            
            
        case .add, .subtract, .divide, .multiply:
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
            
        default:
            appendToCurrentComputation(calcButton: calcButton)
        }

    }
    
    func calculateResult() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(
            of: "%",
            with: "*0.01"
        )
        workings = workings.replacingOccurrences(
            of: multiplySymbol,
            with: "*"
        )
        workings = workings.replacingOccurrences(
            of: divisionSymbol,
            with: "/"
        )
        
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        let expr = NSExpression(format: workings)
        let exprValue = expr.expressionValue(with: nil, context: nil) as! Double
        
        return exprValue
        
    }
    
    func appendToCurrentComputation(calcButton: CalcButton) {
        currentComputation += calcButton.rawValue

    }
    
}


#Preview {
    CalcsButtonView(currentComputation: .constant("5+!"), mainResult: .constant("6"), width: 375)
}
