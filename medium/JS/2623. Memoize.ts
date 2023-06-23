type Fn = (...params: any) => any;

var memoize =
  (fn: (...params: any) => any, cache = {}) =>
  (...args) =>
    cache[args.join()] ?? (cache[args.join()] = fn(...args));

/**
 * let callCount = 0;
 * const memoizedFn = memoize(function (a, b) {
 *	 callCount += 1;
 *   return a + b;
 * })
 * memoizedFn(2, 3) // 5
 * memoizedFn(2, 3) // 5
 * console.log(callCount) // 1
 */
