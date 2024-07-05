import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomCircularChart extends StatelessWidget {
  final String text;
  final double value;

  const CustomCircularChart(
      {super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          radiusFactor: 1,
          interval: 10,
          minimum: 0,
          maximum: 100,
          showTicks: false,
          showLabels: false,
          axisLineStyle: const AxisLineStyle(
            thickness: 20,
            cornerStyle: CornerStyle.bothCurve,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: value,
              width: 20,
              enableAnimation: true,
              gradient: const SweepGradient(
                colors: <Color>[
                  Color(0xFFCDE5FF),
                  Color(0xFFB1D8FF),
                ],
                stops: <double>[0.25, 0.8],
              ),
              cornerStyle: CornerStyle.bothCurve,
            )
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              angle: 270,
              verticalAlignment: GaugeAlignment.far,
              widget: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
