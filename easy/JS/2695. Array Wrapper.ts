interface ArrayWrapper {
  nums: number[];
  valueOf: () => number;
  toString: () => string;
}

function ArrayWrapper(this: ArrayWrapper, nums: number[]): void {
  this.nums = nums;
}

ArrayWrapper.prototype.valueOf = function (this: ArrayWrapper): number {
  return this.nums.reduce((a, b) => a + b, 0);
};

ArrayWrapper.prototype.toString = function (this: ArrayWrapper): string {
  return `[${this.nums}]`;
};
/**
 * const obj1 = new ArrayWrapper([1,2]);
 * const obj2 = new ArrayWrapper([3,4]);
 * obj1 + obj2; // 10
 * String(obj1); // "[1,2]"
 * String(obj2); // "[3,4]"
 */
