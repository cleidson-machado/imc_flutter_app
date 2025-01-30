
// ignore_for_file: avoid_print

class Abacaxi {

  State _state;

  Abacaxi(
    this._state,
  ) {
    transitionTo(_state);
  }

  void transitionTo(State state) {
    print('Context: Transition to ${state.runtimeType}.');
    _state = state;
    _state.setContext(this);
  }


  void request1() {
    _state.handle1();
  }

  void request2() {
    _state.handle2();
  }
}

abstract class State {
  late Abacaxi _abacaxi;

  void setContext(Abacaxi context) {
    _abacaxi = context;
  }

  void handle1();
  void handle2();
}


class ConcreteStateA extends State {
  @override
  void handle1() {
    print('ConcreteStateA handles request1.');
    print('ConcreteStateA wants to change the state of the context.');
    _abacaxi.transitionTo(ConcreteStateB());
  }

  @override
  void handle2() {
    print('ConcreteStateA handles request2.');
  }
}

class ConcreteStateB extends State {
  @override
  void handle1() {
    print('ConcreteStateB handles request1.');
  }

  @override
  void handle2() {
    print('ConcreteStateB handles request2.');
    print('ConcreteStateB wants to change the state of the context.');
    _abacaxi.transitionTo(ConcreteStateA());
  }
}

void main() {
  final context = Abacaxi(ConcreteStateA());
  context.request1();
  context.request2();
}