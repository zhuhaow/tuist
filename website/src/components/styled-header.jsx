/** @jsx jsx */
import { jsx } from 'theme-ui'

const StyledHeader = ({ children }) => {
  return (
    <div
      sx={{
        bg: 'primary',
        py: [4, 4],
        color: 'primaryComplementary',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}
    >
      {children}
    </div>
  )
}

export default StyledHeader
