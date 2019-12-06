//* @jsx jsx */
import { jsx, Styled } from 'theme-ui'
import { withPrefix } from 'gatsby'
import Margin from './margin'

export default () => {
  const copyrightMessage = '© Copyright 2019. All rights reserved'
  return (
    <footer sx={{ py: 3, bg: 'gray1', flex: 1 }}>
      <Margin>
        <div
          sx={{
            color: 'white',
            display: 'flex',
            alignItems: 'center',
            flexDirection: 'column',
            flex: 1,
          }}
        >
          <div
            sx={{
              display: 'flex',
              justifyContent: 'space-between',
              flexDirection: ['column', 'row'],
              flex: 1,
              alignSelf: 'stretch',
            }}
          >
            <div
              sx={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
              }}
            >
              <div
                sx={{
                  display: 'flex',
                  flexDirection: 'row',
                  alignItems: 'center',
                  mt: 2,
                }}
              >
                <img
                  src={withPrefix('logo.svg')}
                  sx={{ height: 30, width: 30 }}
                  alt="Tuist's logotype"
                />
                <Styled.h3 sx={{ color: 'white', ml: 2 }}>Tuist</Styled.h3>
              </div>
            </div>
            <div
              sx={{
                mt: [3, 0],
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
              }}
            >
              <Styled.h3 sx={{ color: 'white', my: 2 }}>
                Documentation
              </Styled.h3>
              <div>Getting started</div>
              <div>Manifest specification</div>
              <div>Dependencies</div>
              <div>Contributors</div>
              <div sx={{ fontSize: 1, mt: 3, display: ['none', 'block'] }}>
                {copyrightMessage}
              </div>
            </div>
            <div
              sx={{
                mt: [3, 0],
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
              }}
            >
              <Styled.h3 sx={{ color: 'white', my: 2 }}>Other</Styled.h3>
              <div>GitHub organization</div>
              <div>Join our Slack</div>
              <div>Blog</div>
              <div>Releases</div>
            </div>
            <div
              sx={{
                fontSize: 1,
                mt: 3,
                display: ['block', 'none'],
                textAlign: 'center',
              }}
            >
              {copyrightMessage}
            </div>
          </div>
        </div>
      </Margin>
    </footer>
  )
}
