class Java {

  public static void main(String[] args) {
    
  }
}

/**
 * Calculate compound interest of an investment and return the amount after specified time period
 */
public double compoundInterest(double principal, double monthlyRate, int numOfMonths) {
    return principal * Math.pow((1 + monthlyRate), numOfMonths);
}

// Calculate compound interest of an investment with additions every month and return the amount after specified time period
float calculateCompoundInterest(float principal, float interest, int years, float monthlyAddition){
    float compoundInterest = 0;
    for(int i = 1; i <= years; i++){
        
        compoundInterest += principal * (interest/100);
    principal += principal * (interest/100);
        
        for(int j = 1; j <= 12; j++){
            compoundInterest += monthlyAddition * (interest/100);
      principal += monthlyAddition * (interest/100);
        }
    }
    return compoundInterest;
}

calculateCompoundInterest(10000, 6, 5, 500);

void compound_interest(double p, double r, int n, int t) {
  double a = p * Math.pow(1 + (r / n), n * t);
  System.out.println("Amount = "+ a);
}
  
compound_interest(20000, .08, 12, 2);

// Calculate compound interest of an investment with additions every month and return the amount after a specified time period.
double compound_interest(double principal, double interest, int time, int freq) {
  double amount = principal * Math.pow(1 + (interest / freq), freq * time);
  return amount;
}

