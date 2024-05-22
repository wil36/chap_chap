module.exports = {
  root: true,
  env: {
    es6: true,
    // node: true,
    // browser: true,

    browser: true,
    commonjs: true,
    module: true,
    // es2021: true,
    node: true,
  },
  extends: ["eslint:recommended", "google"],
  parserOptions: {
    ecmaVersion: 2020,
  },
  rules: {
    quotes: ["error", "double"],
    "no-unused-vars": ["error", { argsIgnorePattern: "^_" }],
  },
};
