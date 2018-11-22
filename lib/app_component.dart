import 'package:angular/angular.dart';
import 'package:number_bomb/src/bombing/bombing_component.dart';
import 'package:number_bomb/src/number-count/number_count_component.dart';
import 'package:number_bomb/src/starter/starter_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    NumberCountComponent,
    StarterComponent,
    BombingComponent,
    coreDirectives
  ],
)
class AppComponent {
  var step = 'starter';
  var times = 0;
  var number = 0;

  onBomb(int number) {
    this.times++;
    this.number = number;
    this.step = 'bombing';
  }

  gotoHome() {
    this.step = 'starter';
    this.number = 0;
    this.times = 0;
  }
}
