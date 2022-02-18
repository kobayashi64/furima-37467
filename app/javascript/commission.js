function count (){
  const price  = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    const countVal = Math.floor(price.value * 0.1)
    const commissionNum  = document.getElementById("add-tax-price");
    commissionNum.innerHTML =  countVal

    const profitVal = Math.floor(price.value - countVal)
    const profitNum  = document.getElementById("profit");
    profitNum.innerHTML =  profitVal
  });
};

window.addEventListener('load', count);
