import 'dart:async';

import 'package:angular/angular.dart';
import 'package:number_bomb/src/helper.dart';

@Component(
  selector: 'bombing',
  templateUrl: 'bombing_component.html',
  styleUrls: ['bombing_component.css']
)
class BombingComponent implements OnInit {
  final homeStream = StreamController<void>();
  final nextStream = StreamController<void>();

  @Output() get home => this.homeStream.stream;
  @Output() get next => this.nextStream.stream;

  @Input() var times = 1;
  @Input() var number = 0;

  @override
  void ngOnInit() {
    playKillAudio(this.times);
  }
}