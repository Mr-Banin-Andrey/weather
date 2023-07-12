
import UIKit


//class DrawOnView: UIView {
//    UIColor.white.setFill()
//    UIColor.white.setStroke()
//
//    // Задание точек графика
//    let graphPath = UIBezierPath()
//
//    // Идем на начало линии графика
//    graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
//
//    // Добавляем точки для каждого элемента в массиве graphPointsAdd
//    // в соответсвующие точки (x, y)
//    for i in 1 ..< graphPoints.count {
//      let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
//      graphPath.addLine(to: nextPoint)
//    }
//}


class GraphView: UIView {
      private enum Constants {
    //        static let cornerRadiusSize = CGSize(width: 18.0, height: 18.0)
        static let margin: CGFloat = 20.0
        static let topBorder: CGFloat = 60
        static let bottomBorder: CGFloat = 42
        static let colorAlpha: CGFloat = 0.3
        static let circleDiameter: CGFloat = 10.0
      }

    //      @IBInspectable var startColor: UIColor = .red
    //      @IBInspectable var endColor: UIColor = .green

//      var graphPoints: [Int] = [20, 12, 10, 9, 8, 7, -7]
      var graphPoints: [Int] = [47, 47, 48, 49, 49, 50, 55]

    
    
      // swiftlint:disable:next function_body_length
      override func draw(_ rect: CGRect) {
            let width = rect.width
            let height = rect.height

          
          let margin = Constants.margin
          let topBorder = Constants.topBorder
          let bottomBorder = Constants.bottomBorder
          let graphHeight = height - topBorder - bottomBorder
          
          guard let maxValue = graphPoints.max() else { return }
          
          let columnXPoint = { (column: Int) -> CGFloat in
            let spacing = (width - margin * 2 - 4) / CGFloat((self.graphPoints.count - 1))
            return CGFloat(column) * spacing + margin + 2
          }
          
          let columnYPoint = { (graphPoint: Int) -> CGFloat in
                let yPoint = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
                return graphHeight + topBorder - yPoint // Переворот графика
          }
          
          UIColor.white.setFill()
          UIColor.blue.setStroke()
              
          // Задание точек графика
          let graphPath = UIBezierPath()

          // Идем на начало линии графика
          graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
              
          // Добавляем точки для каждого элемента в массиве graphPointsAdd
          // в соответсвующие точки (x, y)
          for i in 1 ..< graphPoints.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
          }

          graphPath.stroke()
          for i in 0 ..< graphPoints.count {
            var point = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            point.x -= Constants.circleDiameter / 2
            point.y -= Constants.circleDiameter / 2
                
            let circle = UIBezierPath(
              ovalIn: CGRect(
                origin: point,
                size: CGSize(
                  width: Constants.circleDiameter,
                  height: Constants.circleDiameter)
              )
            )
              print("UIBezierPath", circle)
              
            circle.fill()
            graphPath.stroke()
          }
          
        //    let path = UIBezierPath(
        //      roundedRect: rect,
        //      byRoundingCorners: UIRectCorner.allCorners,
        //      cornerRadii: Constants.cornerRadiusSize
        //    )
//            path.addClip()
//
//            guard let context = UIGraphicsGetCurrentContext() else {
//              return
//            }
//            let colors = [startColor.cgColor, endColor.cgColor]
//
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//
//            let colorLocations: [CGFloat] = [0.0, 1.0]
//
//            guard let gradient = CGGradient(
//              colorsSpace: colorSpace,
//              colors: colors as CFArray,
//              locations: colorLocations
//            ) else {
//              return
//            }
//
//            var startPoint = CGPoint.zero
//            var endPoint = CGPoint(x: 0, y: self.bounds.height)
//            context.drawLinearGradient(
//              gradient,
//              start: startPoint,
//              end: endPoint,
//              options: []
//            )
//
//            let margin = Constants.margin
            

//            let topBorder: CGFloat = Constants.topBorder
//            let bottomBorder: CGFloat = Constants.bottomBorder
//            let graphHeight = height - topBorder - bottomBorder
        //    guard let maxValue = graphPoints.max() else {
        //      return
        //    }
        //    let columnYPoint = { (graphPoint: Int) -> CGFloat in
        //      let yPoint = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
        //      return graphHeight + topBorder - yPoint
        //    }

//            UIColor.white.setFill()
//            UIColor.white.setStroke()

//            let graphPath = UIBezierPath()
        //    graphPath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))

        //    for i in 1..<graphPoints.count {
        //      let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
        //      graphPath.addLine(to: nextPoint)
        //    }

//            context.saveGState()
//
//            guard let clippingPath = graphPath.copy() as? UIBezierPath else {
//              return
//            }

        //    clippingPath.addLine(to: CGPoint(x: columnXPoint(graphPoints.count - 1), y: height))
        //    clippingPath.addLine(to: CGPoint(x: columnXPoint(0), y: height))
//            clippingPath.close()

//            clippingPath.addClip()

        //    let highestYPoint = columnYPoint(maxValue)
        //    startPoint = CGPoint(x: margin, y: highestYPoint)
//            endPoint = CGPoint(x: margin, y: self.bounds.height)

//            context.drawLinearGradient(
//              gradient,
//              start: startPoint,
//              end: endPoint,
//              options: CGGradientDrawingOptions(rawValue: 0)
//            )
//            context.restoreGState()
//
//            graphPath.lineWidth = 2.0
//            graphPath.stroke()
//
//            for i in 0..<graphPoints.count {
        //      var point = CGPoint(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
        //      point.x -= Constants.circleDiameter / 2
        //      point.y -= Constants.circleDiameter / 2
//
//              let circle = UIBezierPath(
//                ovalIn: CGRect(
        //          origin: point,
        //          size: CGSize(width: Constants.circleDiameter, height: Constants.circleDiameter)
//                )
//              )
//              circle.fill()
//            }

//            let linePath = UIBezierPath()
//
//            linePath.move(to: CGPoint(x: margin, y: topBorder))
//            linePath.addLine(to: CGPoint(x: width - margin, y: topBorder))
//
//            linePath.move(to: CGPoint(x: margin, y: graphHeight / 2 + topBorder))
//            linePath.addLine(to: CGPoint(x: width - margin, y: graphHeight / 2 + topBorder))
//
//            linePath.move(to: CGPoint(x: margin, y: height - bottomBorder))
//            linePath.addLine(to: CGPoint(x: width - margin, y: height - bottomBorder))
//            let color = UIColor(white: 1.0, alpha: Constants.colorAlpha)
//            color.setStroke()
//
//            linePath.lineWidth = 1.0
//            linePath.stroke()
      }
}
