class Calculator {
  private res: number;
  constructor(value: number) {
    this.res = value;
  }

  add(value: number): Calculator {
    this.res += value;
    return this;
  }

  subtract(value: number): Calculator {
    this.res -= value;
    return this;
  }

  multiply(value: number): Calculator {
    this.res *= value;
    return this;
  }

  divide(value: number): Calculator {
    if (value == 0) {
      throw new Error("Division by zero is not allowed");
    }
    this.res = this.res / value;
    return this;
  }

  power(value: number): Calculator {
    this.res = Math.pow(this.res, value);
    return this;
  }

  getResult(): number {
    return this.res;
  }
}
