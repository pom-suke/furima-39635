function fee (){
  const itemPrice = document.getElementById("item-price")
  if (itemPrice) {
    itemPrice.addEventListener("input", ()=>{
      const inputValue = itemPrice.value
      const addTaxPrice = document.getElementById("add-tax-price")
      const calcAddTax = Math.floor(inputValue * 0.1)
      addTaxPrice.innerHTML = calcAddTax.toLocaleString()
      const profit = document.getElementById("profit")
      profit.innerHTML = Math.floor(inputValue - calcAddTax).toLocaleString()
    })
  }
}

window.addEventListener('turbo:load', fee)