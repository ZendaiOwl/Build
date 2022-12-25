import java.text.DecimalFormat;

public class CompoundInterest {

  public static void main(String[] args) {
    Double P = getPrincipalAmount(args);
    Double R = getInterestRatePercentile(args);
    Double r = R/100;
    int n = getCompoundingPeriods(args);
    Double t = getYears(args);
    Double A = P * Math.pow((1 + r / n), n * t);
    DecimalFormat decimalFormat = new DecimalFormat("###.##");
    System.out.println(
      "Principal amount: " + P + "\n" +
      "Interest rate: " + R + "%\n" +
      "Interest rate decimal: " + r + "\n" +
      "Compounding periods: " + n + "\n" +
      "Years in decimal: " + t + "\n" +
      "Accrued amount: " + decimalFormat.format(A)
    );
  }

  private static double getPrincipalAmount(String[] args) {
    return Double.parseDouble(args[0]);
  }

  private static double getInterestRatePercentile(String[] args) {
    return Double.parseDouble(args[1]);
  }

  private static int getCompoundingPeriods(String[] args) {
    return Integer.parseInt(args[2]);
  }

  private static double getYears(String[] args) {
    return Double.parseDouble(args[3]);
  }
  
}
