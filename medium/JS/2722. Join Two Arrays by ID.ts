function join(arr1: any[], arr2: any[]): any[] {
  const obj = arr1.reduce((a, { id, ...rest }) => {
    if (!(id in a)) {
      a[id] = {};
    }
    a[id] = { ...a[id], ...rest };
    return a;
  }, {});

  arr2.reduce((a, { id, ...rest }) => {
    if (!(id in a)) {
      a[id] = {};
    }
    a[id] = { ...a[id], ...rest };
    return a;
  }, obj);

  return Object.keys(obj).map((key) => ({ id: parseInt(key), ...obj[key] }));
}
