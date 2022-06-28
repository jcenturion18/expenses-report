//
//  RoudedSectionTableView.swift
//  ExpensesReport
//
//  Created by Julian Centurion on 27/06/2022.
//

import UIKit

class RoudedSectionTableView {
    private static let cornerRadius: CGFloat = 6.0

    // Code extracted from https://gist.github.com/micheltlutz/de304ce9559605792f30056b5b693fe3
    static func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.backgroundColor = UIColor.clear
        let layer: CAShapeLayer = CAShapeLayer()
        let pathRef: CGMutablePath = CGMutablePath()
        // dx leading an trailing margins
        let bounds: CGRect = cell.bounds.insetBy(dx: 0, dy: 0)

        if indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            pathRef.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
        } else if indexPath.row == 0 {
            drawTopRow(with: pathRef, bounds: bounds, cornerRadius: cornerRadius)
            drawLine(on: layer, with: bounds)
        } else if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            drawBottonRow(with: pathRef, bounds: bounds, cornerRadius: cornerRadius)
        } else {
            pathRef.addRect(bounds)
            drawLine(on: layer, with: bounds)
        }

        layer.path = pathRef
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 1
        layer.fillColor = UIColor.white.cgColor

        cell.backgroundView = createBackGroundView(with: bounds, and: layer)
    }

    private static func drawLine(on layer: CALayer, with bounds: CGRect) {
        let lineLayer: CALayer = CALayer()
        let lineHeight: CGFloat = (1 / UIScreen.main.scale)
        lineLayer.frame = CGRect(x: bounds.minX,
                                 y: bounds.size.height - lineHeight,
                                 width: bounds.size.width,
                                 height: lineHeight)
        lineLayer.backgroundColor = UIColor.clear.cgColor
        layer.addSublayer(lineLayer)
    }

    private static func drawTopRow(with pathRef: CGMutablePath, bounds: CGRect, cornerRadius: CGFloat) {
        pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY),
                       tangent2End: CGPoint(x: bounds.midX, y: bounds.minY),
                       radius: cornerRadius)

        pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY),
                       radius: cornerRadius)
        pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
    }

    private static func drawBottonRow(with pathRef: CGMutablePath, bounds: CGRect, cornerRadius: CGFloat) {
        pathRef.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
        pathRef.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY),
                       tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY),
                       radius: cornerRadius)

        pathRef.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY),
                       tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY),
                       radius: cornerRadius)
        pathRef.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
    }

    private static func createBackGroundView(with bounds: CGRect, and layer: CALayer) -> UIView {
        let backgroundView = UIView(frame: bounds)
        backgroundView.layer.insertSublayer(layer, at: 0)
        backgroundView.backgroundColor = .white
        return backgroundView
    }
}
