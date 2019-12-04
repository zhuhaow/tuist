import prismTheme from '@theme-ui/prism/presets/night-owl.json'
import { system } from '@theme-ui/presets'

// Breakpoints
const breakpoints = ['40em', '52em', '64em', '80em']
breakpoints.sm = breakpoints[0]
breakpoints.md = breakpoints[1]
breakpoints.lg = breakpoints[2]
breakpoints.xl = breakpoints[3]

// Radii
const radii = [0, 4, 8, 16]

// Space
const space = [0, 4, 8, 16, 32, 64, 128]
space.small = space[1]
space.medium = space[2]
space.large = space[3]

// Fonts
const fonts = {
  body: 'Inter, sans-serif',
  heading: 'Inter, sans-serif',
  monospace: 'Menlo, monospace',
}

// Font heights
const fontWeights = {
  body: 400,
  heading: 700,
  bold: 700,
}

// Line heights
const lineHeights = {
  body: 1.5,
  heading: 1.125,
}

// Font sizes
const fontSizes = [12, 14, 16, 20, 24, 32]
fontSizes.body = fontSizes[2]
fontSizes.display = fontSizes[5]

// Heading
const heading = {
  fontFamily: 'heading',
}

// Colors
const colors = {
  text: '#000',
  background: '#fff',
  primary: '#12344F',
  primaryComplementary: 'white',
  secondary: '#7768AF',
  accent: '#64c4ed',
  muted: '#F8F8F8',
}

// Styles
const styles = {
  root: {
    fontFamily: 'body',
    lineHeight: 'body',
    fontWeight: 'body',
  },
  a: {
    color: 'inherit',
    backgroundImage: 'none',
    textShadow: 'none',
  },
  p: {
    fontFamily: 'body',
  },
  pre: {
    ...prismTheme,
    margin: 3,
    padding: 3,
    borderRadius: 2,
  },
  code: {
    fontSize: 1,
  },
  blockquote: {
    bg: 'secondary',
    fontSize: 3,
    py: 2,
    px: 3,
    color: 'background',
  },
  h1: {
    ...heading,
    marginTop: 1,
    color: 'primary',
  },
  h2: {
    ...heading,
    marginTop: 3,
    color: 'secondary',
  },
  h3: {
    ...heading,
    color: 'secondary',
  },
  h4: {
    ...heading,
    color: 'secondary',
  },
  h5: {
    ...heading,
    color: 'secondary',
  },
  h6: {
    ...heading,
    color: 'secondary',
  },
}

export default {
  ...system,
  radii,
  breakpoints,
  fonts,
  space,
  fontSizes,
  fontWeights,
  lineHeights,
  styles,
  colors,
}
