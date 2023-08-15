function createObject(keysArr: any[], valuesArr: any[]): Record<string, any> {
  let obj: Record<string, any> = {};
  for (let i = 0; i < keysArr.length; i++) {
    let key: string =
      typeof keysArr[i] == "string" ? keysArr[i] : String(keysArr[i]);
    if (!obj.hasOwnProperty(key)) {
      obj[key] = valuesArr[i];
    }
  }
  return obj;
}
