return {
  parse("imp", "import { $2 } from '$1';"),
  parse("impt", "import type { $2 } from '$1';"),
  parse("impd", "import $2 from '$1';"),
  parse("con", "const $1 = $2;$3"),
  parse("econ", "export const $1 = $2;$3"),
}
