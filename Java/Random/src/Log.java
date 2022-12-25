/* @author Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com> */
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
class Log {
  private static Logger log;
  private static final String err = "Usage: java Log [Log level] Log message ... \nLog levels: Debug: -1, Info: 0, Warning: 1, Error: 2";
  private static final int DEBUG = -1, INFO = 0, WARN = 1, ERROR = 2;
  public static void main(String[] args) {
    log = initLogger();
    log.setLevel(Level.ALL);
    int Lv = Integer.parseInt(args[0]);
    String message = "";
    for (String s: Arrays.copyOfRange(args, WARN, args.length)) { message+=s + " "; }
    if (Lv == DEBUG) { Debug(message); }
    else if (Lv == INFO) { Info(message); }
    else if (Lv == WARN) { Warning(message); }
    else if (Lv == ERROR) { Error(message); }
    else { Error(err); }
  }
  private static Logger initLogger() { return Logger.getAnonymousLogger(); }
  private static void Debug(String msg) { log.log(Level.OFF, msg); }
  private static void Info(String msg) { log.info(msg); }
  private static void Warning(String msg) { log.warning(msg); }
  private static void Error(String msg) { log.log(Level.SEVERE,msg); }
}
