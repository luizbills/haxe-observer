package test;

import observer.*;

private class TestObservable extends Observable {

  public function new() {
    super();
    setChanged();
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

class Test  {

  static function main() {
    var obs:TestObservable = new TestObservable();

    obs.addObserver(new TestObserver('hello'));
    obs.addObserver(new TestObserver('world'));

    obs.notifyObservers('an observer says:');
  }
}
