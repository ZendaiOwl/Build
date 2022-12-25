/**
 * Copyright 2022 Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the Software), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import java.nio.file.*;

public class LearnAPI {
  
  public static void main (String[] args) {
    getWorkingDirectoryNIO();
    getWorkingDirectorySystem();
  }
    /**
     * Here, Paths#get internally uses FileSystem#getPath to fetch the path.
     * It uses the new Java NIO API, so this solution works only with JDK 7 or higher.
     */
    public static void getWorkingDirectoryNIO() {
      String workingDirectory = FileSystems.getDefault().getPath("").toAbsolutePath().toString();
      System.out.println(workingDirectory);
    }

    public static void getWorkingDirectorySystem() {
      String dir2 = System.getProperty("user.dir").toString();
      System.out.println(dir2);
    }

}

