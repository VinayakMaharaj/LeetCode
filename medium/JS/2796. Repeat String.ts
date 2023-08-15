declare global {
  interface String {
    replicate(times: number): string;
  }
}

String.prototype.replicate = function (times: number) {
  return times == 1 ? this : this + this.replicate(times - 1);
};
