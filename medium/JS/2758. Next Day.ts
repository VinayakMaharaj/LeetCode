declare global {
  interface Date {
    nextDay(): string;
  }
}

Date.prototype.nextDay = function () {
  let nextDay = new Date(this.getTime() + 24 * 60 * 60 * 1000);
  let month: string = (nextDay.getMonth() + 1).toString();
  let date: string = nextDay.getDate().toString();
  month = month.length == 1 ? `0${month}` : month;
  date = date.length == 1 ? `0${date}` : date;
  return `${nextDay.getFullYear()}-${month}-${date}`;
};

/**
 * const date = new Date("2014-06-20");
 * date.nextDay(); // "2014-06-21"
 */
