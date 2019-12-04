/** @jsx jsx */
import { jsx } from 'theme-ui'
import { MDXRenderer } from 'gatsby-plugin-mdx'
import Layout from '../components/layout'
import 'semantic-ui-css/semantic.min.css'

const DocumentationPage = ({ data: { mdx } }) => {
  const post = mdx
  return (
    <Layout>
      <MDXRenderer>{post.body}</MDXRenderer>
    </Layout>
  )
}

export const query = graphql`
  query($slug: String!) {
    site {
      siteMetadata {
        title
        siteUrl
      }
    }
    mdx(fields: { slug: { eq: $slug } }) {
      body
    }
  }
`

export default DocumentationPage
