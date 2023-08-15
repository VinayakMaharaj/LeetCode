function* factorial(n: number): Generator<number> {
  if (n === 0) yield 1;
  let prev = 1;
  for (let i = 1; i <= n; i++) {
    prev = prev * i;
    yield prev;
  }
}

/**
 * const gen = factorial(2);
 * gen.next().value; // 1
 * gen.next().value; // 2
 */
