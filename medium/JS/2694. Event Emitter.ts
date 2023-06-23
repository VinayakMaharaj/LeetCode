type Callback = (...args: any[]) => any;
type Subscription = {
  unsubscribe: () => void;
};

class EventEmitter {
  private events: { [event: string]: Set<Callback> };

  constructor() {
    this.events = {};
  }

  subscribe(event: string, callback: Callback): Subscription {
    if (!(event in this.events)) {
      this.events[event] = new Set();
    }
    this.events[event].add(callback);

    return {
      unsubscribe: () => {
        this.events[event].delete(callback);
      },
    };
  }

  emit(event: string, args: any[] = []): any[] {
    if (!(event in this.events)) {
      return [];
    }

    const result: any[] = [];
    this.events[event].forEach((fn) => {
      result.push(fn(...args));
    });

    return result;
  }
}
/**
 * const emitter = new EventEmitter();
 *
 * // Subscribe to the onClick event with onClickCallback
 * function onClickCallback() { return 99 }
 * const sub = emitter.subscribe('onClick', onClickCallback);
 *
 * emitter.emit('onClick'); // [99]
 * sub.unsubscribe(); // undefined
 * emitter.emit('onClick'); // []
 */
