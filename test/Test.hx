package test;

import observer.*;

class Test extends Observable {

  static function main() {
    var obs:Test = new Test();

    obs.addObserver(new TestObserver('hello'));
    obs.addObserver(new TestObserver('world'));
    obs.setChanged();
    obs.notifyObservers('an observer says:');
  }

}

private class TestObserver implements Observer {

  private var msg:String;

  public function new(msg:String) {
    this.msg = msg;
  }

  public function update(observable:Observable, data:Dynamic) {
    trace('$data $msg');
  }

}
