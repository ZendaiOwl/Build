#!/usr/bin/env node

// Calculate compound interest with monthly contributions
function CompoundInterest(principal, interestRate, contribution, years) {
    let balance = principal
    const months = years * 12
    for (let i = 1; i <= months; i++) {
        balance = balance + balance * interestRate / 12 + contribution
    }
    return balance
}
// Monthly contributions
function compound_interest(principal, annual_rate, monthly_rate, years) {
  
  let total = principal;
  
  for (let i = 0; i < years; i++) {
    total = total * (1 + annual_rate);
    total = total + monthly_rate;
  }
  
  return total;
}

function compoundInterest(principal, interest, years, contributions) {
  var amount = principal;
  for (var i = 0; i < years; i++) {
    amount = amount * (1 + interest / 12) + contributions;
  }
  return amount;
}

function compoundInterest(principal, interestRate, monthlyContribution, years){
    //calculate compound interest with monthly contributions
    const numberOfMonths = years * 12;
    let total = 0;
    let interest = 0;
    let newInterest = 0;
    let newPrincipal = 0;
    for(let i = 1; i <= numberOfMonths; i++){
        newPrincipal = total + monthlyContribution;
        interest = (newPrincipal * interestRate) / 12;
        newInterest = interest + newPrincipal;
        total = newInterest;
    }
    return total.toFixed(2);
}

compoundInterest(10000, 0.06, 1000, 12);

// Calculate compound interest of an investment with additions every month and return the amount after a specified time period.
function compoundInterest(p, r, m, t) {
    let ci = p * Math.pow((1 + (r / 12)), (12 * t));
    ci += m * ((Math.pow((1 + (r / 12)), (12 * t)) - 1) / (r / 12));
    return ci;
}
compoundInterest(1000, 0.05, 10, 1);


