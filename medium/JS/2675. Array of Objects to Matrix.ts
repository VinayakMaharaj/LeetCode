function jsonToMatrix(arr: any[]): (string | number | boolean | null)[][] {
  const paths = {};
  const dfs = (index: number, path: string, el: any) => {
    if (el !== null && typeof el === "object") {
      Object.keys(el).forEach((k) =>
        dfs(index, path + (path ? "." : "") + k, el[k])
      );
    } else {
      if (!paths.hasOwnProperty(path))
        paths[path] = new Array(arr.length).fill("");
      paths[path][index] = el;
    }
  };
  arr.forEach((a, k) => dfs(k, "", a));
  const header = Object.keys(paths).sort();
  return [header, ...arr.map((_, i) => header.map((path) => paths[path][i]))];
}
