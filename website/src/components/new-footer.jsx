//* @jsx jsx */
import { jsx, Styled } from "theme-ui";
import Margin from "./margin"

export default () => {
  return <footer sx={{py: 3, bg:"gray1"}}>
    <Margin>
      The new footer
      <div sx={{color: "white", display: "flex", flexDirection: "column"}}>
        <div sx={{display: "flex", flexDirection: "row"}}>
          <div>

          </div>
        </div>
        <div>
          © Copyright 2019. All rights reserved
        </div>
      </div>
    </Margin>
  </footer>
}