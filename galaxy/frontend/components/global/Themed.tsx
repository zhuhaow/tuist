import * as React from 'react'
import { ThemeProvider } from 'styled-components'

const theme = {
  colors: {
    whatever: 'red',
    text: 'red',
    background: '#fff',
    primary: 'red',
  },
  fontSizes: [12, 14, 16, 18, 24, 32, 48, 64, 72],
  fontWeights: {
    body: 400,
    heading: 900,
    bold: 700,
  },
  lineHeights: {
    body: 1.5,
    heading: 1.125,
  },
  textStyles: {
    heading: {
      fontFamily: 'heading',
      fontWeight: 'heading',
      lineHeight: 'heading',
    },
  },
  styles: {
    root: {
      fontFamily: 'body',
      fontWeight: 'body',
      lineHeight: 'body',
    },
    p: {
      fontSize: [2, 3],
    },
    h1: {
      variant: 'textStyles.heading',
      fontSize: [5, 6, 100],
    },
    h2: {
      variant: 'textStyles.heading',
      fontSize: [4, 5],
    },
  },
}

export default ({ children }) => {
  return <ThemeProvider theme={theme}>{children}</ThemeProvider>
}
