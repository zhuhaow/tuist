import React from 'react'
import Menu from './menu'
import { Styled } from 'theme-ui'
import '../styles/main.css'

const Layout = ({ children }) => {
  return (
    <Styled.root>
      <Menu />
      {children}
    </Styled.root>
  )
}

export default Layout
