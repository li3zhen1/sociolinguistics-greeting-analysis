
async function clickExploreMore() {
    const btn = document.querySelector("div.explore-more>button")
    if (btn) {
        btn.click()
        console.log("clicked")
    }
    await new Promise(resolve => setTimeout(resolve, 1000))

}



for (let i = 0; i<20; i++) {
    await clickExploreMore()
}


const movieTites = [...document.querySelectorAll(".drc-subject-info-title-text")].map(it => it.innerText)
console.log(movieTites.length)
console.log(movieTites.join("\n"))