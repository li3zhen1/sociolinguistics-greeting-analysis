import DoubanData from "./douban.json"
// import fs
import fs from "fs"

const titles = DoubanData.map(it => it.children.props.data.title)

// save to json
fs.writeFileSync("./douban_titles.json", JSON.stringify(titles))