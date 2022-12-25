#!/usr/bin/env node
/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
const process = require('process');
const args = process.argv;
const P = process.argv[2];
const R = process.argv[3];
const r = R/100;
const n = args[4];
const t = args[5];

/**
 * Calculate compound interest
 * Formula: A = P(1 + r/n)^nt
 * In the formula

    A = Accrued amount (principal + interest)
    P = Principal amount
    r = Annual nominal interest rate as a decimal
    R = Annual nominal interest rate as a percent
    r = R/100
    n = number of compounding periods per unit of time
    t = time in decimal years; e.g., 6 months is calculated as 0.5 years. Divide your partial year number of months by 12 to get the decimal years.
    I = Interest amount
 */
function compoundInterest() {
  if (args.length <= 2) {
    console.log(`4 Arguments required.
    1: Principal amount
    2: Interest rate percentile
    3: Compounding periods per year
    4: Time in decimal years
    `.trim());
    return;
  }
  let A = P * (1 + r/n)**(n*t);
  console.log(`
Principal amount: ${P}
Percentile annual interest: ${R}
Decimal annual interest: ${r}
Compound periods per unit of time: ${n}
Time in decimal years: ${t}
Accrued amount: ${A.toFixed(2)}
  `.trim());
}

compoundInterest();


