import 'dart:async';

import 'package:angular/angular.dart';

@Component(
  selector: 'starter',
  templateUrl: 'starter_component.html',
  styleUrls: ['starter_component.css']
)
class StarterComponent {
  final _nextStream = StreamController<void>();
  @Output() get next => _nextStream.stream;

  goNext() {
    this._nextStream.add(null);
  }
}
