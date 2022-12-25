/**
 * This program displays the arguments passed to
 * it from the operating system command line.
 * Just something I tried out as I'm learning Java
 */
public class ShowArgs {

  public static void main(String[] args) {
    for (int index = 0; index < args.length; index++ )
      System.out.println(args[index]);
  }
}
