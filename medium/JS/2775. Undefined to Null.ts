function undefinedToNull(obj: Record<any, any>): Record<any, any> {
  if (Array.isArray(obj)) {
    return obj.map(function (item) {
      return undefinedToNull(item);
    });
  } else if (typeof obj === "object" && obj !== null) {
    var result = {};
    for (var key in obj) {
      if (obj.hasOwnProperty(key)) {
        result[key] = undefinedToNull(obj[key]);
      }
    }
    return result;
  } else {
    return obj !== undefined ? obj : null;
  }
}
/**
 * undefinedToNull({"a": undefined, "b": 3}) // {"a": null, "b": 3}
 * undefinedToNull([undefined, undefined]) // [null, null]
 */
