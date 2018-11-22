import 'dart:async';

import 'package:angular/angular.dart';
import 'package:number_bomb/src/contant.dart';

@Component(
  selector: 'dynamic-number',
  template: '{{innerNumber}}'
)
class DynamicNumberComponent implements OnInit, OnChanges {
  int innerNumber = 0;
  int targetNumber = 0;
  Timer timer = null;
  @Input('number') int outerNumber;

  @override
  void ngOnInit() {
    this.innerNumber = this.outerNumber;
  }

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    changes.forEach((propName, change) {
      print("$propName ${change.currentValue}");
      if (propName != 'outerNumber') {
        return;
      }

      this.goto(change.currentValue);
    });
  }

  void goto(int target) {
    this.targetNumber = target;
    this.doGoto();
  }

  void doGoto() {
    var inner = this.innerNumber;
    var target = this.targetNumber;

    var gap = target - inner;

    if (gap == 0) {
      return;
    } else if (gap.abs() < 10) {
      gap = (gap / gap.abs()).ceil();
    } else {
      gap = (gap * STEP_PERCENT).ceil();
    }

    var mid = inner + gap;
    this.innerNumber = mid;

    if (mid != target && (this.timer == null || !this.timer.isActive)) {
      this.timer = new Timer(new Duration(milliseconds: STEP_INTERVAL), this.doGoto);
    }
  }
}
