package observer;

// based on: https://code.google.com/p/ralcr/source/browse/#svn%2Ftrunk%2FDesignPatterns%2FObserver

class Observable {

  private var changed:Bool;
  private var observers:List<Observer>;

  public function new() {
    clearChanged();
    observers = new List<Observer>();
  }

  /**
   * Add an observer to the list of observers
   */
  public function addObserver(obs:Observer):Bool {
    if (obs == null) {
      return false;
    }

    // Don't add an observer more than once
    for (o in observers) {
      if (o == obs) return false;
    }

    // Add the observer in the list
    observers.add(obs);

    return true;
  }

  /**
   * Remove an observer from the list of observers
   */
  public function removeObserver(obs:Observer):Bool {
    return observers.remove(obs);
  }

  /**
   * Remove all observers from the list of observers
   */
  public function removeObservers():Void {
    return observers.clear();
  }

  /**
   * return the number of observers on the list of observers.
   */
  public function countObservers():Int {
    return observers.length;
  }

  /**
   * Tell all observers that the subject has changed
   */
  public function notifyObservers(?data:Dynamic):Void {
    if (!changed) {
      return;
    }

    clearChanged();

    for (obs in observers) {
      obs.update(this, data);
    }
  }

  private function setChanged() {
    changed = true;
  }

  private function clearChanged() {
    changed = false;
  }

  private function hasChanged() {
    return changed;
  }
}
