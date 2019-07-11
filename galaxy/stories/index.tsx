import * as React from 'react'
import { storiesOf } from '@storybook/react'
import IndexPage from '../frontend/components/pages/IndexPage'

const stories = storiesOf('Components', module)

stories.add('Home', () => <IndexPage />, { info: { inline: true } })
