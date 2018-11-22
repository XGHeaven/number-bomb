import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:number_bomb/src/contant.dart';
import 'package:number_bomb/src/dynamic-number/dynamic_number_component.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:number_bomb/src/helper.dart';

@Component(
  selector: 'number-count',
  templateUrl: 'number_count_component.html',
  styleUrls: ['number_count_component.css'],
  directives: [
    DynamicNumberComponent,
    coreDirectives,
    formDirectives,
  ]
)
class NumberCountComponent {
  static Random random = new Random();

  static getRandom() {
    return random.nextInt(RANGE_END - 1) + 1;
  }

  final bombStream = StreamController<int>();

  var start = RANGE_START;
  var end = RANGE_END;
  var target = getRandom();
  String numberText = '';
  var bombing = false;

  @ViewChild('numberInput') InputElement input;

  @Output() get bomb => this.bombStream.stream;

  void goto() {
    var number = int.parse(this.numberText);

    if (number >= this.end || number <= this.start) {
      print('invalid');
      this.doRock();
      return;
    }

    if (number < target) {
      this.start = number;
      playAlive();
    } else if (number > target) {
      this.end = number;
      playAlive();
    } else {
      print('boom');
      this.bombing = true;
      this.input.blur();
      playBombing();
      new Timer(new Duration(milliseconds: 1600), () => this.bombStream.add(this.target));
    }

    this.numberText = '';
  }

  reset() {
    this.start = RANGE_START;
    this.end = RANGE_END;
    this.target = getRandom();
  }

  doRock() {
    this.input.animate([{
      'transform': 'translate(0)',
      'offset': 0
    }, {
      'transform': 'translate(-3vh)',
      'offset': 0.25
    }, {
      'transform': 'translate(3vh)',
      'offset': 0.75
    }, {
      'transform': 'translate(0)',
      'offset': 1
    }], 120);
  }
}
