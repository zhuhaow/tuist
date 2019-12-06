/** @jsx jsx */
import { jsx } from 'theme-ui'
import { MDXRenderer } from 'gatsby-plugin-mdx'
import { graphql } from 'gatsby'
import Layout from '../components/layout'
import Footer from '../components/new-footer'

const DocumentationPage = ({ data: { mdx } }) => {
  const post = mdx
  return (
    <Layout>
      <MDXRenderer>{post.body}</MDXRenderer>
      <Footer/>
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
