window.addEventListener('DOMContentLoaded', function(){
  
  const price = document.getElementById('item-price')
  const tax = document.getElementById('add-tax-price')
  const profit= document.getElementById('profit')

  price.addEventListener('input', function(){
    const calculation = price.value;
    tax.innerHTML = Math.floor(calculation * 0.1);
    profit.innerHTML = Math.floor(calculation * 0.9);
  })
})