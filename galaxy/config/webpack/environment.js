const { environment } = require('@rails/webpacker')
const typescript = require('./loaders/typescript')
const createStyledComponentsTransformer = require('typescript-plugin-styled-components')
  .default

const webpack = require('webpack')

// Styled components
const styledComponentsTransformer = createStyledComponentsTransformer()
const tsLoader = typescript.use.filter(
  loader => loader.loader == 'ts-loader'
)[0]
tsLoader.options.getCustomTransformers = () => ({
  before: [styledComponentsTransformer],
})

environment.loaders.prepend('typescript', typescript)
module.exports = environment
